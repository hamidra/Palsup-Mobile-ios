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
    
    NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationUpdates), name: APNSNotification.notifictionCountUpdate, object: nil)
  }
  
  @objc func handleNotificationUpdates() {
    print("show notes notifictionCountUpdate")
    showNotifications()
  }
  
  func showNotifications() {
    let notificationCounts = SignedInUser.getNotificationCounts()

    if let eventNotificationCount = notificationCounts?[UserDefaultsKeys.notificationCountsKey], eventNotificationCount > 0 {
      self.tabBar.items?[0].badgeValue = "\(eventNotificationCount)"
    }
    if let palNotificationCount = notificationCounts?[UserDefaultsKeys.notificationCountsKey], palNotificationCount > 0 {
      self.tabBar.items?[2].badgeValue = "\(palNotificationCount)"
    }
  }
}
