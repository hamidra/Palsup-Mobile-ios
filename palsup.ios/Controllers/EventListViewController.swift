//
//  EventListViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/7/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Promises
import Kingfisher
import os


class EventListItem {
  var event : Event
  var notifications : NotificationInfo? = nil
  
  init(event:Event, notifications: NotificationInfo? = nil) {
    self.event = event
    self.notifications = notifications
  }
}

class EventListViewController: UIViewController {
  @IBOutlet weak var eventsTableView: UITableView!
  
  lazy var emptyPageView: EmptyPageView = {
    var text = "You currently have no events to show. Go search for your favorite activies. We will show you here any events that you are joind to."
    var view = EmptyPageView(text: text, redirectButtonTitle: "Discover activities", redirectAction: redirectToDiscover)
    return view
  }()
  
  var eventList: [EventListItem] = [] {
    didSet {
      eventsTableView.reloadData()
    }
  }
  
  func eventCellTapAction(oEvent: Event?) {
    if let event = oEvent {
      performSegue(withIdentifier: "showEventConversations", sender: event)
    } else {
      // ToDO: proper error display
      print("event is empty")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showEventConversations" {
      if let vc = segue.destination as? EventPageViewController, let event = sender as? Event {
        vc.event = event
      }
      else
      {
        print("not happening")
      }
    }
  }
  
  func fetchEventsWithNotifications(userId:String) -> Promise<[EventListItem]> {
    return Promise<[EventListItem]> { fulfill, reject in
      let decoder = JSONDecoder()
      // Query Events with notifications for the user
      let gqlGetEventNotificationsForUser = GetEventNotificationsForUserQuery(userId: userId)
      GqlClient.shared.client.fetch(query: gqlGetEventNotificationsForUser) { result in
        var items : [EventListItem] = []
        switch result {
        case .success(let gqlResult):
          if let eventNotifications = gqlResult.data?.getEventNotificationsForUser {
            items = eventNotifications.compactMap({ item in
              if let eventnotification = item {
                do {
                  guard let eventJson = eventnotification.event?.jsonObject else {
                    return nil
                  }
                  let eventData = try JSONSerialization.data(withJSONObject: eventJson, options: [])
                  let event =  try decoder.decode(Event.self, from: eventData )
                  
                  var notifications:NotificationInfo? = nil
                  if let notificationJson = eventnotification.info?.jsonObject {
                    let notificationsData = try JSONSerialization.data(withJSONObject: notificationJson, options: [])
                    notifications = try? decoder.decode(NotificationInfo.self, from: notificationsData)
                  }
                  return EventListItem(event: event, notifications: notifications)
                } catch {
                  print("Error happened in deserialization of notificationItem\(item), error:\(error)")
                }
              }
              return nil
            })
          } else {
            print("getEventNotificationsForUser returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  func fetchEventsWithoutNotifications(userId:String, excludeIds:[String]?) -> Promise<[EventListItem]> {
    return Promise<[EventListItem]> { fulfill, reject in
      let decoder = JSONDecoder()
      // Query Events with no notifications for the user
      let getEventsForUserSortedByDate = GetEventsForUserSortedByDateQuery(userId: userId, excludeIds: excludeIds)
      GqlClient.shared.client.fetch(query: getEventsForUserSortedByDate) { result in
        var items : [EventListItem] = []
        switch result {
        case .success(let gqlResult):
          if let events = gqlResult.data?.getEventsForUserSortedByDate {
            items = events.compactMap({ item in
              if let event = item {
                do {
                  let eventJson = event.jsonObject
                  let eventData = try JSONSerialization.data(withJSONObject: eventJson, options: [])
                  let event =  try decoder.decode(Event.self, from: eventData )
                  return EventListItem(event: event)
                } catch {
                  print("Error happened in deserialization of notificationItem\(item), error:\(error)")
                }
              }
              return nil
            })
          } else {
            print("getEventsForUserSortedByDate returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  func fetchEventsForUser(userId: String) -> Promise<[EventListItem]> {
    return Promise<[EventListItem]> { (fulfill, reject) in
      self.fetchEventsWithNotifications(userId: userId).then({eventsWithNotifications in
        var fetchedEvents:[EventListItem] = eventsWithNotifications
        // get the ids of already fetched events to exclude them from next query
        let excludeIds:[String] = eventsWithNotifications.compactMap({$0.event.id})
        self.fetchEventsWithoutNotifications(userId: userId, excludeIds: excludeIds).then({eventsWithNoNotifications in
          fetchedEvents.append(contentsOf: eventsWithNoNotifications)
          fulfill(fetchedEvents)
        })
      }).catch({error in
        reject(error)
      })
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    /*eventsTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)*/
    setupView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if let uid = SignedInUser.Identity?.id {
      fetchEventsForUser(userId: uid).then({events in
        if events.count > 0 {
          self.eventList = events
          self.eventsTableView.isHidden = false
          self.emptyPageView.isHidden = true
        } else {
          self.eventsTableView.isHidden = true
          self.emptyPageView.isHidden = false
        }
      })
    } else {
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

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.eventList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let eventListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell", for: indexPath)
    
    /*eventListTableViewCell.contentView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)*/
    
    // Set activity label
    eventListTableViewCell.textLabel?.text = eventList[indexPath.row].event.activity
    
    // Set date label
    if let date = eventList[indexPath.row].event.date {
      let dateRange = DateRange(start:Int(date.startDate ?? "NIL"), end:Int(date.endDate ?? "NIL"))
      eventListTableViewCell.detailTextLabel?.text = dateRange.displayDateFromNow() ?? "Anytime"
    } else {
      eventListTableViewCell.detailTextLabel?.text = "Anytime"
    }

    // Set image
    if let imageView = eventListTableViewCell.imageView {
      //imageView.contentMode = .scaleAspectFill
      if let pictureUrl = eventList[indexPath.row].event.absoluteImage {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        eventListTableViewCell.imageView?.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
        {
          result in
          switch result {
          case .success(let value):
            os_log("Task done for)")
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
          }
        }
      }
      imageView.frame = CGRect(x: 0,y: 0,width: 60,height: 60);
    }
    
    // reset accessory
    eventListTableViewCell.accessoryView = nil
    eventListTableViewCell.accessoryType = .disclosureIndicator
    
    if let notifications = eventList[indexPath.row].notifications {
      var isNew = notifications.new ?? false
      var count = notifications.totalCount ?? 0
      if count > 0 {
        var notificationBadges = NotificationBadgeView(frame: CGRect(x:0, y:0, width: 80, height:25))
        notificationBadges.count = count - (isNew ? 1 : 0)
        notificationBadges.isNew = isNew
        eventListTableViewCell.accessoryView = notificationBadges
      }
    }
    
    return eventListTableViewCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("did select row at \(indexPath)")
    if let userId = SignedInUser.Identity?.id, let eventId = self.eventList[indexPath.row].event.id {
      GqlApiProvider.markEventNotificationsAsRead(userId: userId, eventId: eventId)
    }
    eventCellTapAction(oEvent: self.eventList[indexPath.row].event)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
}
