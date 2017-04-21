//
//  NSObject+Extension.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import Foundation

extension NSObject {

  var className: String {
    return String(describing: type(of: self))
  }
  
  class var className: String {
    return "\(self)"
  }
  
}
