//
//  AttendeesListViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/29/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import Promises

class AttendeesListViewController: UIViewController {
  var event: Event?
  var users: [User] = [] {
    didSet {
      userListTableView.reloadData()
    }
  }
  
  var isWaitlist: Bool = false
  
  @IBOutlet weak var userListTableView: UITableView!
  
  func userCellTapAction(user: User?) {
    if let user = user {
      performSegue(withIdentifier: "showUserDetail", sender: user)
    } else {
      // ToDO: proper error display
      print("user is empty")
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showUserDetail" {
      if let vc = segue.destination as? UserInfoViewController, let user = sender as? User {
        vc.eventId = event?.id
        vc.user = user
        vc.isWaitlist = self.isWaitlist
      }
      else
      {
        print("not happening")
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    if (self.isWaitlist) {
      fetchWaitlist().then({ waitlist in
        self.users = waitlist
      })
    } else {
      fetchMembers().then({ members in
        self.users = members
      })
    }
    
    
  }
  
  func fetchMembers() -> Promise<[User]>{
    return Promise<[User]> { fulfill, reject in
      let decoder = JSONDecoder()
      var items: [User] = []
      if let event = self.event, let eid = event.id {
        let getEventMembersQuery = GetEventMembersQuery(eventId: eid)
        GqlClient.shared.client.fetch(query: getEventMembersQuery) { result in
          switch result {
          case .success(let gqlResult):
            if let users = gqlResult.data?.getEventMembers {
              items = users.compactMap({ item in
                if let member = item {
                  do {
                    let userData = try JSONSerialization.data(withJSONObject: member.jsonObject, options: [])
                    let user =  try decoder.decode(User.self, from: userData )
                    return user
                  } catch {
                    print("Error happened in deserialization of memberItem: \(item), error: \(error)")
                    return nil
                  }
                } else {
                  return nil
                }
              })
            } else {
              print("getEventMembers returned no data")
            }
            fulfill(items)
          case .failure(let error):
            reject(error)
          }
        }
      }
    }
  }
  
  func fetchWaitlist() -> Promise<[User]>{
    return Promise<[User]> { fulfill, reject in
      let decoder = JSONDecoder()
      var items: [User] = []
      if let event = self.event, let eid = event.id {
        let getEventWaitlistQuery = GetEventWaitlistQuery(eventId: eid)
        GqlClient.shared.client.fetch(query: getEventWaitlistQuery) { result in
          switch result {
          case .success(let gqlResult):
            if let users = gqlResult.data?.getEventWaitlist {
              items = users.compactMap({ item in
                if let waitlistItem = item {
                  do {
                    let userData = try JSONSerialization.data(withJSONObject: waitlistItem.jsonObject, options: [])
                    let user =  try decoder.decode(User.self, from: userData )
                    return user
                  } catch {
                    print("Error happened in deserialization of waitlistItem: \(waitlistItem), error: \(error)")
                  }
                }
                return nil
              })
            } else {
              print("getEventMembers returned no data")
            }
            fulfill(items)
          case .failure(let error):
            reject(error)
          }
        }
      }
    }
  }
}

extension AttendeesListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let userListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath)
  
    userListTableViewCell.textLabel?.text = users[indexPath.row].name?.first
    if let imageView = userListTableViewCell.imageView, let thumbnailUrl = users[indexPath.row].absolutePicture?.thumbnail {
      imageView.contentMode = .scaleAspectFit
      ImageDownloader.shared.setImage(imageView: imageView, url: thumbnailUrl)
    }
    userListTableViewCell.detailTextLabel?.text = self.isWaitlist ? "Vote" : nil
    return userListTableViewCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("did select row at \(indexPath)")
    userCellTapAction(user: self.users[indexPath.row])
  }
}
