//
//  EventInfoViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/31/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import SnapKit

class EventInfoViewController: UIViewController {
  var event: Event?
  
  lazy var eventDetailView: EventDetailView = {
    return EventDetailView()
  }()
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(eventDetailView)
    return scrollView
  }()
  
  lazy var actionToolbar: LikeBarView = {
    let toolbar = LikeBarView()
    toolbar.acceptAction = self.acceptAction
    toolbar.rejectAction = self.rejectAction
    toolbar.backgroundColor = .clear
    return toolbar
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView(){
    eventDetailView.configure(with: event, exitAction: dismissVC)
    self.view.addSubview(scrollView)
    self.view.addSubview(actionToolbar)
    setupLayout()
  }
  
  func setupLayout() {
    scrollView.translatesAutoresizingMaskIntoConstraints  = false
    scrollView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
    
    eventDetailView.translatesAutoresizingMaskIntoConstraints = false
    eventDetailView.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(scrollView)
      make.right.equalTo(scrollView)
      make.left.equalTo(scrollView)
      make.bottom.equalTo(scrollView).offset(-100)
      make.width.equalTo(self.view)
    }
    
    actionToolbar.translatesAutoresizingMaskIntoConstraints = false
    actionToolbar.snp.makeConstraints { (make)->Void in
      make.left.equalTo(self.view)
      make.right.equalTo(self.view)
      make.bottom.equalTo(self.view).inset(30)
    }
  }
  
  func dismissVC() {
    self.dismiss(animated: true)
  }
  
  func rejectAction() {
    self.dismissVC()
  }
  
  func acceptAction() {
    if let event=self.event, let eventId = event.id, let currentUserId=SignedInUser.Identity?.id {
      GqlApiProvider.addToEventsWaitlist(eventId: eventId, userId: currentUserId)
    } else {
      //ToDO: redirect to signIn page
      print("No user is logged in")
    }
    self.dismissVC()
  }
}
