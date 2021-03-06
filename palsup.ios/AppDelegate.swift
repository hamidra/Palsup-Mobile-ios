//
//  AppDelegate.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/2/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import CoreData
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      // Override point for customization after application launch.
      UIButton.appearance().layer.borderWidth = 10
      
      // Use Firebase library to configure APIs
      FirebaseApp.configure()
      Messaging.messaging().delegate = self
      
      LocationManager.current.start()
      PushNotificationProvider.current.registerForPushNotifications()
      
      // Check if launched from notification
      let notificationOption = launchOptions?[.remoteNotification]

      // 1
      if let notification = notificationOption as? [String: AnyObject],
        let aps = notification["aps"] as? [String: AnyObject] {
        
        (window?.rootViewController as? UITabBarController)?.selectedIndex = 1
      } else {
        (window?.rootViewController as? UITabBarController)?.selectedIndex = 2
      }
      
      SignedInUser.fetchNotifications();
      GqlClient.shared.clearCache();
      return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
      SignedInUser.fetchNotifications()
      GqlClient.shared.clearCache();
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
  

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "palsup_ios")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // Mark: - PushNotification support
    func application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
      let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
      let token = tokenParts.joined()
      // ToDO: might want to remove this log. DeviceToken is PII and exposing it might have security implications
      print("Device Token: \(token)")
    }

    func application(
      _ application: UIApplication,
      didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Failed to register: \(error)")
    }
  
    func application(
      _ application: UIApplication,
      didReceiveRemoteNotification userInfo: [AnyHashable: Any],
      fetchCompletionHandler completionHandler:
      @escaping (UIBackgroundFetchResult) -> Void
    ) {
      guard let notification = userInfo as? [String: AnyObject], let aps = notification["aps"] as? [String: AnyObject] else {
        completionHandler(.failed)
        return
      }
      print("running ---> \n \(aps)")
      var apnsNotification = APNSNotification(info: notification)
      SignedInUser.updateNotifications(notification: apnsNotification)
      GqlClient.shared.clearCache()
      if apnsNotification.type == .newMessage {
        NotificationCenter.default.post(name: APNSNotification.notificationNewMessage, object: nil, userInfo: apnsNotification.data)
      }
      /*print("event \n \(apnsNotification.data[ApnsFieldNames.event] as? Event)")
      print("palId \n \(apnsNotification.data[ApnsFieldNames.palId])")
      print("eventId \n \(apnsNotification.data[ApnsFieldNames.eventId])")
      print("intresetedUser \n \(apnsNotification.data[ApnsFieldNames.interestedUserId])")
      print("message \n \(apnsNotification.data[ApnsFieldNames.message] as? Message)")
      print("newMember \n \(apnsNotification.data[ApnsFieldNames.memberUser] as? User)")*/
      completionHandler(.newData)
      return
    }

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate : MessagingDelegate {
  // [START refresh_token]
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
    print("Firebase registration token: \(fcmToken)")
    
    let dataDict:[String: String] = ["token": fcmToken]
    NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    SignedInUser.setPushNotificationToken(token: fcmToken)
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new token is generated.
  }
  
  // [END refresh_token]
  // [START ios_10_data_message]
  // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
  // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
  func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
    print("Received data message: \(remoteMessage.appData)")
  }
  // [END ios_10_data_message]
}


