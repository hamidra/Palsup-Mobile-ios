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
  }
