//
//  EmptyPageView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 3/29/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class EmptyPageView: UIView {
  var labelText: String?;
  var redirectButtonTitle: String?
  var redirectAction: (()->Void)?

  
  lazy var redirectButton: UIButton = {
    var button = UIButton()
    var padding: CGFloat = 10
    button.setTitle(redirectButtonTitle, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemBlue
    button.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    button.addTarget(self, action: #selector(redirect), for: .touchUpInside)
    return button
  }()
  
  lazy var textLabel: UILabel = {
    var label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  convenience init(text: String, redirectButtonTitle: String, redirectAction: (()->Void)? ) {
    self.init(frame: CGRect.zero)
    self.labelText = text
    self.redirectButtonTitle = redirectButtonTitle
    self.redirectAction = redirectAction
    setupView()
  }
  
  func setupView() {
    textLabel.text = self.labelText
    self.addSubview(textLabel)
    self.addSubview(redirectButton)
    setupLayout()
  }
  
  func setupLayout() {
    textLabel.snp.makeConstraints({ make in
      make.centerX.equalTo(self)
      make.centerY.equalTo(self).multipliedBy(4.0/5.0)
      make.width.equalTo(self).multipliedBy(2.0/3.0)
    })
    
    redirectButton.snp.makeConstraints({ make in
      make.centerX.equalTo(self)
      make.top.equalTo(textLabel.snp.bottom).offset(20)
    })
  }
  
  @objc func redirect(){
    self.redirectAction?()
  }
}
