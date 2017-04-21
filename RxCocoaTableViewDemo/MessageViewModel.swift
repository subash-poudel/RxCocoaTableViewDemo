//
//  MessageViewModel.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import Foundation
import RxSwift

class MessageViewModel {
  private var readMessagesSet = Set<Message>()
  private let  messages: [Message]
  
  var allMessages: Variable<[Message]>
  

  
  init(withMessage messages: [Message]) {
    self.messages = messages
    allMessages = Variable<[Message]>(messages)
  }
  
  func getAllMessages() {
    allMessages = Variable<[Message]>(messages)
  }
  
  func read(message: Message) {
    readMessagesSet.insert(message)
  }
  
  func getReadMessage() {
    let readMessages:[Message] = messages.filter({readMessagesSet.contains($0)})
    allMessages.value.removeAll()
    allMessages.value.append(contentsOf: readMessages)
//    allMessages = Variable<Message>(readMessages)
  }
  
  func getAllMessage() {
    allMessages.value.removeAll()
    allMessages.value.append(contentsOf: messages)
  }
  
  func getUnreadMessage() {
    let unReadMessages:[Message] = messages.filter({!readMessagesSet.contains($0)})
    allMessages.value.removeAll()
    allMessages.value.append(contentsOf: unReadMessages)
  }
  
}
