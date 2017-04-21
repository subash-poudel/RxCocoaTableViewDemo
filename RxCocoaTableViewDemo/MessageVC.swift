//
//  ViewController.swift
//  RxCocoaTableViewDemo
//
//  Created by Subash Poudel on 4/21/17.
//  Copyright © 2017 leapfrog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MessageVC: UIViewController {
  @IBOutlet var segmentedControl: UISegmentedControl!
  @IBOutlet var tableView: UITableView!
  private var viewModel: MessageViewModel!
  private let disposeBag = DisposeBag()
  
  private let cellHeight: CGFloat = 120
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.estimatedRowHeight = cellHeight
    tableView.rowHeight = UITableViewAutomaticDimension
    mvvmSetup()
    registerCells()
    initializeSegmentedControl()
    initializeTableView(message: viewModel.allMessages)
  }
  
  // should be replaced by co-ordinator may be next time
  private func mvvmSetup() {
    let messages = Message.getMessages()
    viewModel = MessageViewModel(withMessage: messages)
  }
  
  private func initializeSegmentedControl() {
    segmentedControl.rx.selectedSegmentIndex
      .asObservable()
      .subscribe(onNext: { [weak self] index in
        if let msgType = MessageType(rawValue: index), let strongSelf = self {
          switch msgType {
          case .all:
            strongSelf.viewModel.getAllMessage()
          case .read:
            strongSelf.viewModel.getReadMessage()
          case .unread:
            strongSelf.viewModel.getUnreadMessage()
          }
        }
      })
      .addDisposableTo(disposeBag)
  }
  
  private func registerCells() {
    let nib = UINib(nibName: MessageCell.className, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: MessageCell.className)
  }
  
  private func initializeTableView(message: Variable<[Message]>) {
    
    // cell for row at indexpath
    message.asObservable()
      .bindTo(tableView.rx.items(cellIdentifier: MessageCell.className, cellType: MessageCell.self)) { indexpath, message, cell in
        cell.fromLabel.text = "From: \(message.from)"
        cell.toLabel.text = "To: \(message.to)"
        cell.messageTextLabel.text = "Message: \n\(message.text)"
      }.addDisposableTo(disposeBag)
    
    // did select item at index path
    tableView.rx.modelSelected(Message.self)
      .subscribe(onNext: {[weak self] message in
        guard let strondSelf = self else { return }
        strondSelf.viewModel.read(message: message)
      })
      .addDisposableTo(disposeBag)
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

enum MessageType: Int {
  case all
  case read
  case unread
}
