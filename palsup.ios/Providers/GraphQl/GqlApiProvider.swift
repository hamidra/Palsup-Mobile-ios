//
//  GqlApiProvider.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/13/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation
import Promises

typealias NotificationCounts = GetNotificationCountsForUserQuery.Data.GetNotificationCountsForUser

class GqlApiProvider {
  
  public static func updateUser(id:String, user:UserInput) -> Promise<User> {
    return Promise<User> { fulfill, reject in
      let decoder = JSONDecoder()
      // Create user
      let gqlUpdateUser = UpdateUserMutation(id: id, user: user)
      GqlClient.shared.client.perform(mutation: gqlUpdateUser) { result in
        switch result {
        case .success(let gqlResult):
          if let userJson = gqlResult.data?.updateUser?.jsonObject {
            do {
              let userData = try JSONSerialization.data(withJSONObject: userJson, options: [])
              let user =  try decoder.decode(User.self, from: userData )
              fulfill(user)
            } catch {
              print("Error happened in deserialization of User, error:\(error)")
              reject(error)
            }
          } else {
            print("UpdateUser returned no created user")
            reject(GenericError("CreateUserMutation returned no created user"))
          }
        case .failure(let error):
          reject(error)
        }
      }
    }
  }

  public static func addToEventsWaitlist (eventId: String, userId: String) -> Promise<String?> {
    return Promise<String?> { fulfill, reject in
      let addToEventsWaitlistMutation = AddToEventsWaitlistMutation(eventId: eventId, userId: userId)
      GqlClient.shared.client.perform(mutation: addToEventsWaitlistMutation) {
        result in
        switch result {
        case .success(let gqlResult):
          print("added to the event's Waitlist")
          fulfill(gqlResult.data?.addToEventsWaitlist)
        case .failure(let error):
          print(error)
          reject(error)
        }
      }
    }
  }
  
  public static func addToPalsInterested(palId: String, interestedPalId: String) -> Promise<String?> {
    return Promise<String?> { fulfill, reject in
      let addToPalsInterestedMutation = AddToPalsInterestedMutation(palId: palId, interestedPalId: interestedPalId)
      GqlClient.shared.client.perform(mutation: addToPalsInterestedMutation) {
        result in
        switch result {
        case .success(let gqlResult):
          fulfill(gqlResult.data?.addToPalsInterested)
        case .failure(let error):
          print(error)
          reject(error)
        }
      }
    }
  }
  
  public static func markEventNotificationsAsRead(userId: String, eventId: String) -> Promise<Int?> {
    return Promise<Int?> { fulfill, reject in
      var markEventNotificationsAsReadMutation = MarkEventNotificationsAsSeenMutation(userId: userId, eventId: eventId)
      GqlClient.shared.client.perform(mutation: markEventNotificationsAsReadMutation) { result in
        switch result {
        case .success(let gqlResult):
          // ToDO: Remove Clear Cache after changing the fetch operations to watch.
          GqlClient.shared.clearCache()
          
          fulfill(gqlResult.data?.markEventNotificationsAsSeen)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  public static func markPalNotificationsAsRead(userId: String, palId: String) -> Promise<Int?> {
    return Promise<Int?> { fulfill, reject in
      var markPalNotificationsAsReadMutation = MarkPalNotificationsAsSeenMutation(userId: userId, palId: palId)
      GqlClient.shared.client.perform(mutation: markPalNotificationsAsReadMutation) { result in
        switch result {
        case .success(let gqlResult):
          // ToDO: Remove Clear Cache after changing the fetch operations to watch.
          GqlClient.shared.clearCache()
          
          fulfill(gqlResult.data?.markPalNotificationsAsSeen)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
  
  public static func getNotificationCountsForUser (userId: String) -> Promise<NotificationCounts?> {
    return Promise<NotificationCounts?> { fulfill, reject in
      let getNotificationCountsForUserQuery = GetNotificationCountsForUserQuery(userId: userId)
      GqlClient.shared.client.fetch(query: getNotificationCountsForUserQuery) { result in
        switch result {
          case .success(let gqlResult):
            fulfill(gqlResult.data?.getNotificationCountsForUser)
          case .failure(let error):
            reject(error)
        }
      }
    }
  }
  
  public static func getPalsByActivity(userId: String, activityFilter: ActivityFilterInput) -> Promise<[Pal]> {
    let decoder = JSONDecoder()
    return Promise<[Pal]> { fulfill, reject in
      var items: [Pal] = []
      let gqlGetPalsByActivityQuery = GetPalsByActivityQuery(userId: userId, activityFilter: activityFilter)
      GqlClient.shared.client.fetch(query: gqlGetPalsByActivityQuery) { result in
        switch result {
        case .success(let gqlResult):
          if let pals = gqlResult.data?.getPalsByActivity {
            items = pals.compactMap({ item in
              if let palItem = item {
                do {
                  let palData = try JSONSerialization.data(withJSONObject: palItem.jsonObject, options: [])
                  let pal =  try decoder.decode(Pal.self, from: palData )
                  return pal
                } catch {
                  print("Error happened in deserialization of palItem\(palItem), error:\(error)")
                  return nil
                }
              } else {
                return nil
              }
            })
          } else {
            print("getPalsByActivity returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  public static func getPalsByActivityGroupedByUser(userId: String, activityFilter: ActivityFilterInput) -> Promise<[PalsGroupedByUser]> {
    let decoder = JSONDecoder()
    return Promise<[PalsGroupedByUser]> { fulfill, reject in
      var items: [PalsGroupedByUser] = []
      let gqlGetPalsByActivityGroupedByUserQuery = GetPalsByActivityGroupedByUserQuery(userId: userId, activityFilter: activityFilter)
      GqlClient.shared.client.fetch(query: gqlGetPalsByActivityGroupedByUserQuery) { result in
        switch result {
        case .success(let gqlResult):
          if let palsGroupedByUser = gqlResult.data?.getPalsByActivityGroupedByUser {
            items = palsGroupedByUser.compactMap({ item in
              if let palItem = item {
                do {
                  let palData = try JSONSerialization.data(withJSONObject: palItem.jsonObject, options: [])
                  let pal =  try decoder.decode(PalsGroupedByUser.self, from: palData )
                  return pal
                } catch {
                  print("Error happened in deserialization of palItem\(palItem), error:\(error)")
                  return nil
                }
              } else {
                return nil
              }
            })
          } else {
            print("getPalsByActivityGroupedByUser returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  public static func getEventsByActivity(userId: String, activityFilter: ActivityFilterInput) -> Promise<[Event]> {
    let decoder = JSONDecoder()
    return Promise<[Event]> { fulfill, reject in
      var items: [Event] = []
      let gqlGetEventsByActivityQuery = GetEventsByActivityQuery(userId: userId, activityFilter: activityFilter)
      GqlClient.shared.client.fetch(query: gqlGetEventsByActivityQuery) { result in
        switch result {
        case .success(let gqlResult):
          if let events = gqlResult.data?.getEventsByActivity {
            items = events.compactMap({ item in
              if let eventItem = item {
                do {
                  let eventData = try JSONSerialization.data(withJSONObject: eventItem.jsonObject, options: [])
                  let event =  try decoder.decode(Event.self, from: eventData )
                  return event
                } catch {
                  print("Error happened in deserialization of eventItem\(eventItem), error:\(error)")
                  return nil
                }
              } else {
                return nil
              }
            })
          } else {
            print("getEventsByActivity returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  public static func getEventConversation(eventId: String) -> Promise<[Message]> {
    let decoder = JSONDecoder()
    return Promise<[Message]> { fulfill, reject in
      var items: [Message] = []
      let gqlGetEventConversationQuery = GetEventConversationQuery(eventId: eventId)
      GqlClient.shared.client.fetch(query: gqlGetEventConversationQuery) { result in
        switch result {
          case .success(let gqlResult):
            if let messages = gqlResult.data?.getEventConversation?.group.conversation {
              items = messages.compactMap({ item in
                if let item = item {
                  do {
                    let messageData = try JSONSerialization.data(withJSONObject: item.jsonObject, options: [])
                    let message =  try decoder.decode(Message.self, from: messageData )
                    return message
                  } catch {
                    print("Error happened in deserialization of messageItem\(item), error:\(error)")
                    return nil
                  }
                } else {
                  return nil
                }
              })
            } else {
              print("getEventsByActivity returned no data")
            }
            return fulfill(items)
          case .failure(let error):
            print(error)
            reject(error)
        }
      }
    }
  }
}
