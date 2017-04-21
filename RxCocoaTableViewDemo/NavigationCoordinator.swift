//
//  Coordinator.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationCoordinator: class {
  var navigationController: UINavigationController { get set }
  var viewControllers: [UIViewController] { get set }
  init(navigationController: UINavigationController, viewControllers: [UIViewController])
}
