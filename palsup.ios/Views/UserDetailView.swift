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
    return label
  }()
  lazy var educationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var bioTextView: UITextView = {
    let textView = UITextView()
    textView.isScrollEnabled = false
    textView.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    textView.textAlignment = .left
    textView.textColor = .black
    return textView
  }()
  lazy var userImage: UIImageView = {
    let image = UIImageView()
    image.backgroundColor = UIColor.clear
    image.contentMode = .scaleAspectFill
    return image
  }()
  lazy var exitButton: UIButton = {
    let button = UIButton()
    button.setBackgroundImage(UIImage(named: "downArrow"), for: .normal)
    button.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
    return button
  }()
  lazy var userInfoStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [nameLabel, educationLabel, workLabel, bioTextView])
    stack.alignment = .leading
    stack.spacing = 10
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
    addSubview(userImage)
    addSubview(userInfoStack)
    addSubview(exitButton)
    setupLayout()
  }
  
  private func setupLayout() {
    userImage.translatesAutoresizingMaskIntoConstraints  = false;
    userImage.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
      make.height.equalTo(userImage.snp.width).multipliedBy(4.0/3.0)
    }
    bioTextView.translatesAutoresizingMaskIntoConstraints  = false;
    bioTextView.snp.makeConstraints{ (make) -> Void in
      make.left.equalTo(userInfoStack)
      make.right.equalTo(userInfoStack)
    }
    exitButton.translatesAutoresizingMaskIntoConstraints = false
    exitButton.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(userImage.snp.bottom).offset(-30)
      make.right.equalTo(userImage).offset(-30)
      make.width.equalTo(60)
      make.height.equalTo(exitButton.snp.width)
    }
    userInfoStack.translatesAutoresizingMaskIntoConstraints = false
    userInfoStack.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(userImage.snp.bottom).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
      make.bottom.equalTo(self)
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
      self.nameLabel.text = username.first.capitalized
      
      // set education label
      if let educations = user.education, educations.count > 0, let education = educations[0]?.fragments.educationFields  {
        self.educationLabel.text = "\(education.school.capitalized) \(education.classOf?.capitalized ?? "")"
      }
      
      // set work label
      if let works = user.work, works.count > 0, let work = works[0]?.fragments.workFields {
        self.workLabel.text = "\(work.title?.capitalized ?? "") \(work.organization.capitalized)"
      }
      
      // set bio label
      self.bioTextView.text = "Entrepreneur and businessman Bill Gates and his business partner Paul Allen founded and built the world's largest software business, Microsoft, through technological innovation, keen business strategy and aggressive business tactics. In the process, Gates became one of the richest men in the world. In February 2014, Gates announced that he was stepping down as Microsoft's chairman to focus on charitable work at his foundation, the Bill and Melinda Gates Foundation."
      
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
