//
//  AvatarBarView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/23/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class AvatarBarView: UIView {
  var users: [User] = []
  
  // specifies the total number of the users regardless of how many are passed to the component in self.users
  var trueCount: Int = 0
  
  var tapAction: (()->Void)?
  
  lazy var firstAvatar: CircleImageView = {
    let avatar = CircleImageView()
    avatar.contentMode = .scaleAspectFill
    avatar.isHidden = true
    return avatar
  }()
  
  lazy var titleLabel: UILabel = {
    let title = UILabel()
    title.textAlignment = .center
    title.isHidden = true
    return title
  }()
  
  lazy var secondAvatar: CircleImageView = {
    let avatar = CircleImageView()
    avatar.contentMode = .scaleAspectFill
    avatar.isHidden = true
    return avatar
  }()
  
  lazy var restAvatar: CircleLabel = {
    let avatar = CircleLabel()
    avatar.isHidden = true
    avatar.textAlignment = .center
    avatar.backgroundColor = UIColor.lightGray
    return avatar
  }()
  
  lazy var avatarStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [firstAvatar, secondAvatar, restAvatar])
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = -10
    return stackView
  }()
  
  @objc func handleTapGesture() {
    if let tapAction = self.tapAction {
      tapAction()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  func setupView() {
    addSubview(avatarStack)
    // set the tapgestire recogniser
    var tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
    self.addGestureRecognizer(tapGestureRecogniser)
    setupLayout()
  }
  
  func setupLayout() {
    avatarStack.snp.makeConstraints({make in
      make.edges.equalTo(self)
    })
    firstAvatar.snp.makeConstraints({make in
      make.width.equalTo(firstAvatar.snp.height)
    })
    secondAvatar.snp.makeConstraints({make in
      make.width.equalTo(secondAvatar.snp.height)
    })
    restAvatar.snp.makeConstraints({make in
      make.width.equalTo(restAvatar.snp.height)
    })
  }
  
  func configure(users:[User], tapAction: (()->Void)?) {
    self.users = users
    if users.count > 0 {
      if let url = self.users[0].absolutePicture?.medium {
        ImageDownloader.shared.setImage(imageView: firstAvatar, url: url).then({_ in
          self.firstAvatar.isHidden = false
        })
      }
      self.tapAction = tapAction
    } else {
      self.firstAvatar.isHidden = true
    }
    
    if users.count > 1 {
      if let url = self.users[1].absolutePicture?.medium {
        ImageDownloader.shared.setImage(imageView: secondAvatar, url: url).then({_ in
          self.secondAvatar.isHidden = false
        })
        
      }
    } else {
      self.secondAvatar.isHidden = true
    }
    
    if (trueCount - 2) > 0 {
      restAvatar.text = "\(trueCount - 2)+"
      restAvatar.isHidden = false
    } else {
      restAvatar.isHidden = true
    }
  }
}
