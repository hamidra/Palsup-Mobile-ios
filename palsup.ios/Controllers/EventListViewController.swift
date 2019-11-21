//
//  EventListViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/7/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Promises

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
  
  var userId = "5c6383c5ad48667dc5bec1b2"
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
      if let vc = segue.destination as? EventConversationViewController, let event = sender as? Event {
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
  
  func fetchEventsWithNoNotifications(userId:String, excludeIds:[String]?) -> Promise<[EventListItem]> {
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
        self.fetchEventsWithNoNotifications(userId: userId, excludeIds: excludeIds).then({eventsWithNoNotifications in
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
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    fetchEventsForUser(userId: self.userId).then({events in
      self.eventList = events
    })
  }
}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.eventList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let eventListTabelViewCell = tableView.dequeueReusableCell(withIdentifier: "EventListTableViewCell", for: indexPath)
    eventListTabelViewCell.textLabel?.text = eventList[indexPath.row].event.activity
    eventListTabelViewCell.detailTextLabel?.text = "Today"
    return eventListTabelViewCell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("did select row at \(indexPath)")
    eventCellTapAction(oEvent: self.eventList[indexPath.row].event)
  }
}
