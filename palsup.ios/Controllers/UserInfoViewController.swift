//
//  PalDetailViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/31/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import SnapKit

class UserInfoViewController: UIViewController {

  var pal:GetPalsByActivityQuery.Data.GetPalsByActivity?
  
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
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView(){
    userDetailView.configure(with: pal?.user, exitAction: dismissVC)
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
      make.bottom.equalTo(self.view)
      make.height.equalTo(self.view).multipliedBy(0.1)
    }
  }
  
  func dismissVC() {
    self.dismiss(animated: true)
  }
  
  func rejectAction() {
    self.dismissVC()
  }
  
  func acceptAction() {
    if let pal=self.pal, let currentPal=SignedInUser.currentPal {
      let addToPalsInterestedMutation = AddToPalsInterestedMutation(palId: pal.id, interestedPalId: currentPal.id)
      GqlClient.shared.client.perform(mutation: addToPalsInterestedMutation) {
        result in
        switch result {
        case .success(let gqlResult):
          if gqlResult.data?.addToPalsInterested == nil {
            print("could not find the pal")
          }
        case .failure(let error):
          print(error)
        }
        
      }
    }
    self.dismissVC()
  }
}
