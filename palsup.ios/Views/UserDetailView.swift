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
  var user: User?
  var exitAction: (()->Void)?
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.titleFontSize), weight: .bold)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var workLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.subtitleFontSize), weight: .regular)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var workIcon: UIImageView = {
    let icon = UIImageView(image: UIImage(named: "work"))
    icon.contentMode = .scaleAspectFit
    return icon
  }()
  lazy var workStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [workIcon, workLabel])
    stackView.axis = .horizontal
    stackView.spacing = 5
    return stackView
  }()
  lazy var educationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.subtitleFontSize), weight: .regular)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var educationIcon: UIImageView = {
    let icon = UIImageView(image: UIImage(named: "education"))
    icon.contentMode = .scaleAspectFit
    return icon
  }()
  lazy var educationStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [educationIcon, educationLabel])
    stackView.axis = .horizontal
    stackView.spacing = 5
    return stackView
  }()
  lazy var bioTextView: UITextView = {
    let textView = UITextView()
    textView.isScrollEnabled = false
    textView.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.contentFontSize), weight: .regular)
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
    let stack = UIStackView(arrangedSubviews: [nameLabel, educationStack, workStack, bioTextView])
    stack.alignment = .leading
    stack.spacing = 10
    stack.axis = .vertical
    return stack
  }()
    
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
    educationIcon.translatesAutoresizingMaskIntoConstraints = false;
    educationIcon.snp.makeConstraints { (make) -> Void in
      make.width.equalTo(self).multipliedBy(UIStyle.iconWidthRatioSmall)
      make.height.equalTo(educationIcon.snp.width)
    }
    workIcon.translatesAutoresizingMaskIntoConstraints  = false;
    workIcon.snp.makeConstraints { (make) -> Void in
      make.width.equalTo(self).multipliedBy(UIStyle.iconWidthRatioSmall)
      make.height.equalTo(workIcon.snp.width)
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
      make.width.equalTo(self).multipliedBy(UIStyle.buttonWidthRatioMedium)
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
  
  func configure(with oUser: User?, exitAction:(()->Void)?) {
    if let user = oUser {
      self.user = user
      // set name label
      if let firstName = user.name?.first {
        self.nameLabel.text = firstName.capitalized
      }
      
      // set education label
      if let educations = user.education, educations.count > 0 {
        self.educationLabel.text = "\(educations[0].school?.capitalized ?? "") \(educations[0].classOf?.capitalized ?? "")"
      }
      self.educationStack.isHidden = (self.educationLabel.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      
      // set work label
      if let works = user.work, works.count > 0 {
        self.workLabel.text = "\(works[0].title?.capitalized ?? "") \(works[0].organization?.capitalized ?? "")"
      }
      self.workStack.isHidden = (self.workLabel.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      
      // set bio label
      if let bio = user.bio {
        self.bioTextView.text = bio
      }
      self.bioTextView.isHidden = (self.bioTextView.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      
      // set user image
      if let pictureUrl = user.absolutePicture?.medium {
        ImageDownloader.shared.setImage(imageView: self.userImage, url: pictureUrl)
      }
    }
    //set exit action
    self.exitAction = exitAction
  }
}
