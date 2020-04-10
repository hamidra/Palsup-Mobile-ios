//
//  EventPageViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/21/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import SnapKit

class EventPageViewController: UIViewController {
  var event: Event?
  var updateEventCallback: ((Event?)->())?
  
  /*override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }*/
  
  
  
  lazy var eventHeader: EventHeaderView = {
    var view = EventHeaderView()
    let padding = CGFloat(10)
    view.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    return view
  }()
  
  lazy var editEventBarButton: UIBarButtonItem = {
    var barButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(toEditEvent))
    return barButton
  }()
  
  let conversationViewController = EventConversationViewController()
  
  /// Required for the `MessageInputBar` to be visible
  override var canBecomeFirstResponder: Bool {
    return conversationViewController.canBecomeFirstResponder
  }
  
  /// Required for the `MessageInputBar` to be visible
  override var inputAccessoryView: UIView? {
    return conversationViewController.inputAccessoryView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupView()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if self.isMovingFromParent {
      // propagate the updated event to the previous ViewController!
      self.updateEventCallback?(self.event)
    }
  }
  
  func setupView() {
    eventHeader.configure(oEvent: event, memberAction: memberTapAction, waitlistAction: waitlistTapAction)
    self.navigationItem.rightBarButtonItem = editEventBarButton
    self.view.addSubview(eventHeader)
  
    /// Add the `ConversationViewController` as a child view controller
    conversationViewController.willMove(toParent: self)
    conversationViewController.event = self.event
    addChild(conversationViewController)
    self.view.addSubview(conversationViewController.view)
    conversationViewController.didMove(toParent: self)

    setupLayout()
  }
  
  func setupLayout() {
    eventHeader.sizeToFit()
    eventHeader.translatesAutoresizingMaskIntoConstraints = false
    eventHeader.snp.makeConstraints({make in
      make.top.equalTo(self.view.safeAreaLayoutGuide)
      make.width.equalTo(self.view)
      //make.height.equalTo(300)
    })
    conversationViewController.view.translatesAutoresizingMaskIntoConstraints = false
    conversationViewController.view.snp.makeConstraints({make in
      make.top.equalTo(eventHeader.snp.bottom)
      make.width.equalTo(self.view)
      make.bottom.equalTo(self.view)
    })
  }
  
  func memberTapAction() {
    performSegue(withIdentifier: "toMembers", sender: self.event)
  }
  
  func waitlistTapAction() {
    performSegue(withIdentifier: "toWaitlist", sender: self.event)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toMembers" {
      if let vc = segue.destination as? AttendeesListViewController, let event = sender as? Event {
        vc.event = event
        vc.isWaitlist = false
      }
    } else if segue.identifier == "toWaitlist" {
       if let vc = segue.destination as? AttendeesListViewController, let event = sender as? Event {
        vc.event = event
        vc.isWaitlist = true
      }
    }
  }
  
  @objc func toEditEvent() {
    let vc = EditEventViewController()
    vc.event = self.event
    vc.updateEventCallback = {event in
      self.event = event
    }
    self.show(vc, sender: nil)
  }
}
