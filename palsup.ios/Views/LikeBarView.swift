//
//  VoteBarView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/26/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class LikeBarView: UIView {
  
  var acceptAction: (()->Void)?
  var rejectAction: (()->Void)?
  
  lazy var crossButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.addTarget(self, action:#selector(crossTapAction), for: .touchUpInside)
    button.setImage(UIImage(named: "cross"), for: .normal)
    return button
  }()
  
  lazy var high5Button: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(high5TapAction), for: .touchUpInside)
    button.backgroundColor = .clear
    button.setImage(UIImage(named: "high5"), for: .normal)
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  func setupView() {
    self.addSubview(crossButton)
    self.addSubview(high5Button)
    setupLayout()
  }
  
  func setupLayout() {
    crossButton.translatesAutoresizingMaskIntoConstraints = false
    crossButton.snp.makeConstraints { (make)->Void in
      make.right.equalTo(self.snp.centerX).offset(-20)
      make.top.equalTo(self)
      make.bottom.equalTo(self)
      make.width.equalTo(self).multipliedBy(UIStyle.buttonWidthRatioMedium)
      make.height.equalTo(crossButton.snp.width)
    }
    
    high5Button.translatesAutoresizingMaskIntoConstraints = false
    high5Button.snp.makeConstraints { (make)->Void in
      make.left.equalTo(self.snp.centerX).offset(20)
      make.top.equalTo(self)
      make.bottom.equalTo(self)
      make.width.equalTo(self).multipliedBy(UIStyle.buttonWidthRatioMedium)
      make.height.equalTo(high5Button.snp.width)
    }
  }
  
  @objc func crossTapAction() {
    if let reject = self.rejectAction {
      reject()
    }
  }
  
  @objc func high5TapAction() {
    if let accept = self.acceptAction {
      accept()
    }
  }
}
