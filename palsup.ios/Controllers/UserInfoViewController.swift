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

  lazy var userDetailView: UserDetailView = {
    return UserDetailView()
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView(){
    userDetailView.configure(with: pal?.user, exitAction: dismissVC)
    self.view.addSubview(userDetailView)
    setupLayout()
  }
  
  func setupLayout() {
    userDetailView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
  }
  
  var pal:GetPalsByActivityQuery.Data.GetPalsByActivity?
  
  func dismissVC() {
    self.dismiss(animated: true)
  }
}
