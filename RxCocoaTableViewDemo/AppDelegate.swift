//
//  AppDelegate.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var appCoordinator: AppCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    appCoordinator = AppCoordinator()
    if let window = self.window {
      appCoordinator.start(window: window)
    } else {
      log("window is nil. investigate")
    }
    return true
  }

}

