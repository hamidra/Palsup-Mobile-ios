//
//  PushNotificationProvider.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/5/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class PushNotificationProvider: NSObject {
  private static var _current: PushNotificationProvider? = nil
  
  public static var current: PushNotificationProvider {
    if _current == nil {
      _current = PushNotificationProvider()
    }
    return _current!
  }
  
  func registerForPushNotifications() {
    UNUserNotificationCenter.current().delegate = self
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { [weak self] granted, error in
      if let error = error {
        print("Error happened while registering for PushNotifications. Error:\(error)")
        return
      }
      print("Permission granted: \(granted)")
      guard granted else { return }
      self?.getNotificationSettings()
    })
  }
  
  func getNotificationSettings() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      print("Notification settings: \(settings)")
      guard settings.authorizationStatus == .authorized else { return }
      DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
      }
    }
  }
}

extension PushNotificationProvider: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    print(userInfo)
    completionHandler()
  }
}
