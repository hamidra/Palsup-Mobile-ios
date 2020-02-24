//
//  SignedInUser.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/26/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation
import Promises
import Kingfisher
import CoreLocation

class UserDefaultsKeys {
  public static let userKey = "user"
  public static let notificationCountsKey = "notificationCounts"
  public static let eventNotificationCountKey = "eventNotificationCount"
  public static let palNotificationCountKey = "palNotificationCount"
}

class SignedInUser {
  private static var _user: User? = nil
  private static var _profileImageCache: ImageCache? = nil
  private static var _radius: Int = 50 // miles
  private static var _location: Location? = nil
  private static var _pushNotificationToken: String? = nil
  
  static var currentPal : CreatePalMutation.Data.CreatePal?
  
  static var Identity: User? {
    if _user == nil {
      let defaults = UserDefaults.standard
      if let userData = defaults.data(forKey: UserDefaultsKeys.userKey) {
        let decoder = JSONDecoder()
        do {
          _user = try decoder.decode(User.self, from: userData)
        } catch {
          print("error happned deserializing the user from UserDefaults")
        }
      } else {
        // redirect to SignIn page
        print("No user has signed in. Ask user to sign in")
      }
    }
    return _user
  }
  
  static var profileImageCache: ImageCache {
    if _profileImageCache == nil {
      _profileImageCache = ImageCache(name: "profileImageCache")
      // Limit memory cache size to 10 MB.
      _profileImageCache?.memoryStorage.config.totalCostLimit = 100 * 1024 * 1024
      // Limit disk cache size to 100 MB.
      _profileImageCache?.diskStorage.config.sizeLimit = 1000 * 1024 * 1024
      // Memory image expires after 24 hours.
      _profileImageCache?.memoryStorage.config.expiration = .seconds(24*60*60)
      // Disk image never expires.
      _profileImageCache?.diskStorage.config.expiration = .never
    }
    return _profileImageCache!
  }
  
  static func SignIn(username: String, pass: String) -> Promise<Any> {
    // Signin to the App
    return getUserByAuthInfo(username: username, pass: pass).then({oUser in
      guard let user = oUser else {
        print("SignIn failed. No User was returned")
        throw GenericError("SignIn failed. No User was returned")
      }
      do {
        try setUser(user: user)
        fetchNotifications()
        return Promise(user)
      } catch {
        print("SignIn failed. error:\(error)")
        throw error
      }
    })
  }
  
  static func setUser(user:User, syncModel: Bool = true) throws {
    let jsonEncoder =  JSONEncoder()
    let userData = try jsonEncoder.encode(user)
    let defaults = UserDefaults.standard
    defaults.set(userData, forKey: UserDefaultsKeys.userKey)
    _user = user
    
    if syncModel {
      var hasUpdate = false
      var userInput = UserInput()
      // sync location and push notification token with the server
      if let location = _location, let lat = location.coordinates?.latitude, let long = location.coordinates?.longitude {
        userInput.location = LocationInput(address: location.address, city: location.city, state: location.state, coordinates: CoordinatesInput(longitude: long, latitude: lat), radius: location.radius );
        hasUpdate = true
      }
      if let pushToken = _pushNotificationToken {
        userInput.pushNotificationToken = pushToken;
        hasUpdate = true
      }
      if let uid = user.id, hasUpdate {
        GqlApiProvider.updateUser(id: uid, user: userInput)
      }
    }
  }
  
  static func setLocation(location: CLLocation) {
    do {
      var coordinates = Coordinates(longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
      _location = Location(coordinates: coordinates, radius: _radius)
      if var user = Identity {
        user.location = _location
        try setUser(user: user)
      }
    } catch {
      print("error happened setting the location \(error)")
    }
  }
  
  static func setLocation(place: CLPlacemark) {
    do {
      if let location = place.location  {
        let coordinates = Coordinates( longitude: location.coordinate.longitude, latitude: location.coordinate.latitude)
        let address = "\(place.subThoroughfare ?? "") \(place.thoroughfare ?? "")"
        _location = Location(address: address, city: place.locality, state: place.administrativeArea, coordinates: coordinates, radius: _radius)
        if var user = Identity {
          user.location = _location
          try setUser(user: user)
        }
      }
    } catch {
      print("error happened setting the location \(error)")
    }
  }
  
  static func setPushNotificationToken(token: String) {
    do {
      _pushNotificationToken = token
      if var user = Identity {
        user.pushNotificationToken = _pushNotificationToken
        try setUser(user: user)
      }
    } catch {
      print("error happened setting the push notification token for the user \(error)")
    }
  }
  
  static func fetchNotifications() {
    if let user = Identity, let userId = user.id {
      GqlApiProvider.getNotificationCountsForUser(userId: userId).then({ counts in
        if let noteCounts = counts {
          var notificationCounts = [String:Int]()
          notificationCounts[UserDefaultsKeys.eventNotificationCountKey] = noteCounts.event
          notificationCounts[UserDefaultsKeys.palNotificationCountKey] = noteCounts.pal
          setNotifications(notificationCounts: notificationCounts)
        }
      })
    }
  }
  
  static func updateNotifications(notification: APNSNotification) {
    if Identity != nil {
      if var counts = getNotificationCounts() {
        let eventNotificationCount = counts[UserDefaultsKeys.eventNotificationCountKey] ?? 0
        let palNotificationCount = counts[UserDefaultsKeys.palNotificationCountKey] ?? 0
        switch(notification.type) {
          case .newEvent, .newEventMember, .newMessage, .newEventInterest:
            counts[UserDefaultsKeys.eventNotificationCountKey] = eventNotificationCount + 1
          case .newPalInterest:
            counts[UserDefaultsKeys.palNotificationCountKey] = palNotificationCount + 1
          default:
            break
        }
        setNotifications(notificationCounts: counts)
      }
    }
  }
  
  static func setNotifications(notificationCounts: [String:Int]) {
    let defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    do {
      let notificationCountsData = try encoder.encode(notificationCounts)
      defaults.set(notificationCountsData, forKey: UserDefaultsKeys.notificationCountsKey)
      NotificationCenter.default.post(name: APNSNotification.notifictionCountUpdate, object: nil)
    } catch {
      print("there was an error while setting notification counts \(error)")
    }
  }
  
  
  static func getNotificationCounts() -> [String:Int]? {
    let defaults = UserDefaults.standard
    let decoder = JSONDecoder()
    var counts:[String:Int]? = nil
    do {
      if let notificationCountsData = defaults.data(forKey: UserDefaultsKeys.notificationCountsKey) {
        counts = try decoder.decode([String:Int].self, from: notificationCountsData)
      }
    } catch {
      print("there was an error while retrieving event notification counts \(error)")
    }
    return counts
  }
  
  static func SignOut() {
    let defaults = UserDefaults.standard
    defaults.removeObject(forKey: UserDefaultsKeys.userKey)
    defaults.removeObject(forKey: UserDefaultsKeys.notificationCountsKey)
  }
  
  static func getUserByAuthInfo(username: String, pass: String) -> Promise<User?> {
    return Promise<User?> { fulfill, reject in
      let authInfo = AuthInfoInput(userAuthId: username, passwordHash: pass)
      let getUserByAuthInfo = GetUserByAuthInfoQuery(authInfo: authInfo)
      GqlClient.shared.client.fetch(query: getUserByAuthInfo) { result in
        switch result {
        case .success(let gqlResult):
          do {
            guard let userJson = gqlResult.data?.getUserByAuthInfo?.jsonObject else {
              print("no user was returned")
              return fulfill(nil)
            }
            let userData = try JSONSerialization.data(withJSONObject: userJson, options: [])
            let decoder = JSONDecoder()
            let user = try decoder.decode(User.self, from: userData)
            return fulfill(user)
          } catch {
            print("Error happened in deserialization of user:\(gqlResult), error:\(error)")
            return reject(error)
          }
        case .failure(let error):
          return reject(error)
        }
      }
    }
  }
}
