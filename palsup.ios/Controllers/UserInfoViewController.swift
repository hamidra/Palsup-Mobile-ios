//
//  UserInfoViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/30/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import SnapKit
import Promises

class UserInfoViewController: UIViewController {
  
  var user: User?
  var eventId: String?
  var isWaitlist: Bool = false {
    didSet {
      actionToolbar.isHidden = !isWaitlist
    }
  }
  
  lazy var userDetailView: UserDetailView = {
    return UserDetailView()
  }()
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(userDetailView)
    return scrollView
  }()
  
  lazy var actionToolbar: VoteBarView = {
    let toolbar = VoteBarView()
    toolbar.acceptAction = self.acceptAction
    toolbar.rejectAction = self.rejectAction
    toolbar.backgroundColor = .clear
    return toolbar
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView(){
    userDetailView.configure(with: user, exitAction: dismissVC)
    self.view.addSubview(scrollView)
    self.view.addSubview(actionToolbar)
    setupLayout()
  }
  
  func setupLayout() {
    scrollView.translatesAutoresizingMaskIntoConstraints  = false
    scrollView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
    userDetailView.translatesAutoresizingMaskIntoConstraints = false
    userDetailView.snp.makeConstraints { (make)->Void in
      make.top.equalTo(scrollView)
      make.right.equalTo(scrollView)
      make.left.equalTo(scrollView)
      make.bottom.equalTo(scrollView).offset(-100)
      make.width.equalTo(self.view)
      //make.height.greaterThanOrEqualTo(self.view).priority(.required)
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
    if let eid = self.eventId, let uid = self.user?.id {
      submitVoteOnEventsWaitlist(eventId: eid, waitlistUserId: uid, vote: false).then({ eventId in
        if eventId == nil {
          print("mutation returned nil. Vote submit was not successful.")
        }
        self.dismissVC()
      })
    }
  }
  
  func acceptAction() {
    if let eid = self.eventId, let uid = self.user?.id {
      submitVoteOnEventsWaitlist(eventId: eid, waitlistUserId: uid, vote: true).then({ eventId in
        if eventId == nil {
          print("mutation returned nil. Vote submit was not successful.")
        }
        self.dismissVC()
      })
    }
  }
}

extension UserInfoViewController {
  func submitVoteOnEventsWaitlist(eventId: String, waitlistUserId: String, vote: Bool) -> Promise<String?> {
    return Promise<String?> { fulfill, reject in
      var submitVoteOnEventsWaitlistMutation = SubmitVoteOnEventsWaitlistMutation(eventId: eventId, waitlistUserId: waitlistUserId, vote: vote)
      GqlClient.shared.client.perform(mutation: submitVoteOnEventsWaitlistMutation) { result in
        switch result {
        case .success(let gqlResult):
          fulfill(gqlResult.data?.submitVoteOnEventsWaitlist)
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
}
