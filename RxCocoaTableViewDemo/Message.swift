//
//  Message.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import Foundation

struct Message {
  let text: String
  let from: String
  let to: String
}

extension Message {
  static func getMessages() -> [Message] {
    var messages: [Message] = []
    for index in 2...6 {
      let from = "Tom"
      let to = "Jerry"
      let text = "Caught you \(index) times."
      let message = Message(text: text, from: from, to: to)
      messages.append(message)
    }
    return messages
  }
}

extension Message: Hashable {
  var hashValue: Int {
    return text.hashValue
  }
  
  static func ==(lhs: Message, rhs: Message) -> Bool {
    return lhs.from == rhs.from &&
      lhs.to == rhs.to &&
      lhs.text == rhs.text
  }
}
