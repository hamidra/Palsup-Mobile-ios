//
//  TabBarController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/22/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    print("show notes, launch")
    showNotifications()
    
    NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationUpdates), name: APNSNotification.notificationCountUpdate, object: nil)
  }
  
  @objc func handleNotificationUpdates() {
    print("show notes notificationCountUpdate")
    showNotifications()
  }
  
  func showNotifications() {
    let notificationCounts = SignedInUser.getNotificationCounts()

    if let eventNotificationCount = notificationCounts?[UserDefaultsKeys.eventNotificationCountKey], eventNotificationCount > 0 {
      self.tabBar.items?[0].badgeValue = "\(eventNotificationCount)"
    }
    if let palNotificationCount = notificationCounts?[UserDefaultsKeys.palNotificationCountKey], palNotificationCount > 0 {
      self.tabBar.items?[2].badgeValue = "\(palNotificationCount)"
    }
  }
}
