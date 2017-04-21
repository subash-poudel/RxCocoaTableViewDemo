//
//  AppCoordinator.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: NavigationCoordinator {
  
  var navigationController: UINavigationController
  var viewControllers: [UIViewController]
  
  required init(navigationController: UINavigationController, viewControllers: [UIViewController]) {
    self.navigationController = navigationController
    self.viewControllers = viewControllers
  }
  
  func start(window: UIWindow) {
    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }
  
}

extension AppCoordinator {
  
  convenience init() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let rootVC = storyboard.instantiateViewController(withIdentifier: MessageVC.className)
    let navigationController = UINavigationController(rootViewController: rootVC)
    self.init(navigationController: navigationController, viewControllers: [])
  }
  
}
