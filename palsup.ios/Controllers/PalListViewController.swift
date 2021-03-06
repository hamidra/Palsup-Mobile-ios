//
//  PalListViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/19/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Promises

class PalListItem {
  var pal : Pal
  var notifications : NotificationInfo? = nil
  
  init(pal:Pal, notifications: NotificationInfo? = nil) {
    self.pal = pal
    self.notifications = notifications
  }
}

class PalListViewController: UIViewController {

  @IBOutlet weak var palsTableView: UITableView!
  
  lazy var emptyPageView: EmptyPageView = {
    var text = "You currently have no search history. Go discover your favorite activies!"
    var view = EmptyPageView(text: text, redirectButtonTitle: "Discover activities", redirectAction: redirectToDiscover)
    return view
  }()
  
  var palList: [PalListItem] = [] {
    didSet {
      palsTableView.reloadData()
    }
  }
  
  func palCellTapAction(oPal: Pal?) {
    if let pal = oPal {
      let filter = SearchFilter()
      filter.activity = pal.activity
      filter.date = DateRange(start: Int(pal.date?.startDate ?? "NIL"), end: Int(pal.date?.endDate ?? "NIL"))
      performSegue(withIdentifier: "showActivitySearch", sender: filter)
    } else {
      // ToDO: proper error display
      print("pal is empty")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showActivitySearch" {
      if let vc = segue.destination as? SearchResultViewController, let filter = sender as? SearchFilter {
        vc.searchFilter = filter
      }
      else
      {
        print("not happening")
      }
    }
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let uid = SignedInUser.Identity?.id {
      fetchPalsForUser(userId: uid).then({pals in
        self.palList = pals
        if pals.count > 0 {
          self.palsTableView.isHidden = false
          self.emptyPageView.isHidden = true
        } else {
          self.palsTableView.isHidden = true
          self.emptyPageView.isHidden = false
        }
      })
    }
    else {
      //ToDO: redirect to signIn page
      print("No user is logged in")
    }
  }
  
  func setupView() {
    emptyPageView.isHidden = true
    self.view.addSubview(emptyPageView)
    setupLayout()
  }
  
  func setupLayout() {
    emptyPageView.snp.makeConstraints({ make in
      make.edges.equalTo(self.view)
    })
  }
  
  @objc func redirectToDiscover(){
    self.tabBarController?.selectedIndex = 1
  }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PalListViewController : UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.palList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let palListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PalListTableViewCell", for: indexPath)
    
    // Set the activity label
    palListTableViewCell.textLabel?.text = palList[indexPath.row].pal.activity
    
    // Set date label
    if let date = palList[indexPath.row].pal.date {
      let dateRange = DateRange(start:Int(date.startDate ?? "NIL"), end:Int(date.endDate ?? "NIL"))
      palListTableViewCell.detailTextLabel?.text = dateRange.displayDateFromNow() ?? "Anytime"
    } else {
      palListTableViewCell.detailTextLabel?.text = "Anytime"
    }
    
    // reset accessory
    palListTableViewCell.accessoryView = nil
    palListTableViewCell.accessoryType = .disclosureIndicator
    
    // set notification badges
    if let notifications = palList[indexPath.row].notifications {
      var isNew = notifications.new ?? false
      var count = notifications.totalCount ?? 0
      if count > 0 {
        let notificationBadges = NotificationBadgeView(frame: CGRect(x:0, y:0, width: 80, height:25))
        notificationBadges.count = count - (isNew ? 1 : 0)
        notificationBadges.isNew = isNew
        palListTableViewCell.accessoryView = notificationBadges
      }
    }
    
    return palListTableViewCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("did select row at \(indexPath)")
    if let userId = SignedInUser.Identity?.id, let palId = self.palList[indexPath.row].pal.id {
      GqlApiProvider.markPalNotificationsAsRead(userId: userId, palId: palId)
    }
    palCellTapAction(oPal: self.palList[indexPath.row].pal)
  }
}

// MARK: - API calls to fetch data
extension PalListViewController {
  func fetchPalsWithNotifications(userId:String) -> Promise<[PalListItem]> {
    return Promise<[PalListItem]> { fulfill, reject in
      let decoder = JSONDecoder()
      // Query Pals with notifications for the user
      let gqlGetPalNotificationsForUser = GetPalNotificationsForUserQuery(userId: userId)
      GqlClient.shared.client.fetch(query: gqlGetPalNotificationsForUser) { result in
        var items : [PalListItem] = []
        switch result {
        case .success(let gqlResult):
          if let palNotifications = gqlResult.data?.getPalNotificationsForUser {
            items = palNotifications.compactMap({ item in
              if let palnotification = item {
                do {
                  guard let palJson = palnotification.pal?.jsonObject else {
                    return nil
                  }
                  let palData = try JSONSerialization.data(withJSONObject: palJson, options: [])
                  let pal =  try decoder.decode(Pal.self, from: palData )
                  
                  var notifications:NotificationInfo? = nil
                  if let notificationJson = palnotification.info?.jsonObject {
                    let notificationsData = try JSONSerialization.data(withJSONObject: notificationJson, options: [])
                    notifications = try? decoder.decode(NotificationInfo.self, from: notificationsData)
                  }
                  return PalListItem(pal: pal, notifications: notifications)
                } catch {
                  print("Error happened in deserialization of notificationItem\(item), error:\(error)")
                  return nil
                }
              }
              return nil
            })
          } else {
            print("getPalNotificationsForUser returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  func fetchPalsWithNoNotifications(userId:String, excludeIds:[String]?) -> Promise<[PalListItem]> {
    return Promise<[PalListItem]> { fulfill, reject in
      let decoder = JSONDecoder()
      // Query Pals with no notifications for the user
      let getPalsForUserSortedByDate = GetPalsForUserSortedByDateQuery(userId: userId, excludeIds: excludeIds)
      GqlClient.shared.client.fetch(query: getPalsForUserSortedByDate) { result in
        var items : [PalListItem] = []
        switch result {
        case .success(let gqlResult):
          if let pals = gqlResult.data?.getPalsForUserSortedByDate {
            items = pals.compactMap({ item in
              if let pal = item {
                do {
                  let palJson = pal.jsonObject
                  let palData = try JSONSerialization.data(withJSONObject: palJson, options: [])
                  let pal =  try decoder.decode(Pal.self, from: palData )
                  return PalListItem(pal: pal)
                } catch {
                  print("Error happened in deserialization of notificationItem\(item), error:\(error)")
                  return nil
                }
              }
              return nil
            })
          } else {
            print("getPalsForUserSortedByDate returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  func fetchPalsForUser(userId: String) -> Promise<[PalListItem]> {
    return Promise<[PalListItem]> { (fulfill, reject) in
      self.fetchPalsWithNotifications(userId: userId).then({palsWithNotifications in
        var fetchedPals:[PalListItem] = palsWithNotifications
        // get the ids of already fetched pals to exclude them from next query
        let excludeIds:[String] = palsWithNotifications.compactMap({$0.pal.id})
        self.fetchPalsWithNoNotifications(userId: userId, excludeIds: excludeIds).then({palsWithNoNotifications in
          fetchedPals.append(contentsOf: palsWithNoNotifications)
          fulfill(fetchedPals)
        })
      }).catch({error in
        reject(error)
      })
    }
  }
}
