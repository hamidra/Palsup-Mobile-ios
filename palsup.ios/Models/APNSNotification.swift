//
//  APNSNotifications.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/17/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation

public enum ApnsNotificationType: String {
    case newEvent = "NEW_EVENT"
    case newMessage = "NEW_MESSAGE"
    case newPalInterest = "NEW_PAL_INTEREST"
    case newEventInterest = "NEW_EVENT_INTEREST"
    case newEventMember = "NEW_EVENT_MEMBER"
}

public class ApnsFieldNames {
  static let event = "event"
  static let message = "message"
  static let palId = "palId"
  static let interestedUserId = "interestedUserId"
  static let eventId = "eventId"
  static let memberUser = "memberUser"
}

public class APNSNotification {
  
  public static let notificationCountUpdate = Notification.Name("notificationCountUpdate")
  public static let notificationNewMessage = Notification.Name("notificationNewMessage")
  
  let type: ApnsNotificationType?
  var data =  [String: Any?]()
  init(info: [String: AnyObject]) {
    let decoder = JSONDecoder()
    if let noteType = ApnsNotificationType(rawValue:info["type"] as? String ?? "") {
      type = noteType
      switch type {
      case .newEvent :
        if let jsonStr = info[ApnsFieldNames.event] as? String {
          let jsonData = jsonStr.data(using:.utf8)
          data[ApnsFieldNames.event] = try? decoder.decode(Event.self, from: jsonData!)
        }
      case .newMessage:
        if let jsonStr = info[ApnsFieldNames.message] as? String {
          var jsonData = jsonStr.data(using:.utf8)
          data[ApnsFieldNames.message] = try? decoder.decode(Message.self, from: jsonData!)
        }
      case .newPalInterest:
        if let palId = info[ApnsFieldNames.palId] as? String, let interestedUserId = info[ApnsFieldNames.interestedUserId] as? String {
          data[ApnsFieldNames.palId] = palId
          data[ApnsFieldNames.interestedUserId] = interestedUserId
        }
      case .newEventInterest:
        if let eventId = info[ApnsFieldNames.eventId] as? String, let interestedUserId = info[ApnsFieldNames.interestedUserId] as? String {
          data[ApnsFieldNames.eventId] = eventId
          data[ApnsFieldNames.interestedUserId] = interestedUserId
        }
      case .newEventMember:
        if let eventId = info[ApnsFieldNames.eventId] as? String, let memberJsonStr = info[ApnsFieldNames.memberUser] as? String {
          data[ApnsFieldNames.eventId] = eventId
          let jsonData = memberJsonStr.data(using:.utf8)
          data[ApnsFieldNames.memberUser] = try? decoder.decode(User.self, from: jsonData!)
        }
      default:
        break
      }
    } else {
      type = nil
    }
  }
}
