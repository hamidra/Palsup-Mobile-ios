//
//  UserDetailView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/31/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class UserDetailView: UIView {
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var workLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    label.textAlignment = .left
    label.textColor = .black
    label.text = "Microsoft"
    return label
  }()
  lazy var educationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    label.textAlignment = .left
    label.textColor = .black
    label.text = "Univeristy of Arizona"
    return label
  }()
  lazy var userImage: UIImageView = {
    let image = UIImageView()
    image.backgroundColor = UIColor.clear
    image.contentMode = .scaleAspectFit
    return image
  }()
  lazy var exitButton: UIButton = {
    let button = UIButton()
    button.setTitle("Dismiss", for: .normal)
    button.setTitleColor(.red, for: .normal)
    button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    return button
  }()
  lazy var imageStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [userImage, exitButton])
    stack.alignment = .trailing
    stack.distribution = .fill
    stack.contentMode = .bottomRight
    stack.axis = .vertical
    return stack
  }()
  lazy var userInfoStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [nameLabel, educationLabel, workLabel])
    stack.alignment = .leading
    stack.distribution = .fill
    stack.contentMode = .scaleToFill
    stack.axis = .vertical
    return stack
  }()
  
  var user: GetPalsByActivityQuery.Data.GetPalsByActivity.User?
  var exitAction: (()->Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = .clear
    addSubview(imageStack)
    addSubview(userInfoStack)
    setupLayout()
  }
  
  private func setupLayout() {
    userImage.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(imageStack).offset(0)
      make.left.equalTo(imageStack).offset(0)
      make.right.equalTo(imageStack).offset(0)
      make.height.greaterThanOrEqualTo(self).multipliedBy(0.5)
    }
    exitButton.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(userImage.snp.bottom).offset(-20)
      make.right.equalTo(imageStack).offset(-20)
    }
    imageStack.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
    }
    userInfoStack.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(imageStack.snp.bottom).offset(20)
      make.bottom.equalTo(self).offset(-100)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
    }
  }
  
  @objc func dismissVC() {
    if let exitAction = self.exitAction {
      exitAction()
    }
  }
  
  func configure(with oUser: GetPalsByActivityQuery.Data.GetPalsByActivity.User?, exitAction:(()->Void)?) {
    if let user = oUser {
      self.user = user
      // set name label
      let username = user.name.fragments.nameFields
      self.nameLabel.text = username.first
      
      // set user image
      if let pictureUrl = user.absolutePicture?.fragments.pictureFields.medium {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        self.userImage.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
        {
          result in
          switch result {
          case .success(let value):
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
          }
        }
      }
    }
    //set exit action
    self.exitAction = exitAction
  }
}
