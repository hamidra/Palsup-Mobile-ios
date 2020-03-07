//
//  EventDetailView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/31/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class EventDetailView: UIView {

  lazy var membersAvatarBar: AvatarBarView = {
    let avatarBar = AvatarBarView()
    return avatarBar
  }()
  
  lazy var activityLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.titleFontSize), weight: .bold)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var eventImage: UIImageView = {
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
  lazy var descriptionTextView: UITextView = {
    let textView = UITextView()
    textView.isScrollEnabled = false
    textView.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.contentFontSize), weight: .regular)
    textView.textAlignment = .left
    textView.textColor = .black
    return textView
  }()
  lazy var eventInfoStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [activityLabel, descriptionTextView])
    stack.alignment = .leading
    stack.spacing = 10
    stack.axis = .vertical
    return stack
  }()
  
  var event: Event?
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
    addSubview(eventImage)
    addSubview(exitButton)
    addSubview(eventInfoStack)
    addSubview(membersAvatarBar)
    setupLayout()
  }
  
  private func setupLayout() {
    eventImage.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
      make.height.equalTo(eventImage.snp.width).multipliedBy(4.0/3.0)
    }
    exitButton.snp.makeConstraints { (make) -> Void in
       make.top.equalTo(eventImage.snp.bottom).offset(-30)
       make.right.equalTo(eventImage).offset(-30)
       make.width.equalTo(60)
       make.height.equalTo(exitButton.snp.width)
    }
    descriptionTextView.translatesAutoresizingMaskIntoConstraints  = false;
    descriptionTextView.snp.makeConstraints{ (make) -> Void in
      make.left.equalTo(eventInfoStack)
      make.right.equalTo(eventInfoStack)
    }
    eventInfoStack.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(eventImage.snp.bottom).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
      make.bottom.equalTo(self)
    }
    membersAvatarBar.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(eventImage.snp.top).offset(20)
      make.left.equalTo(eventImage.snp.left).offset(20)
      make.width.equalTo(40)
    }
  }
  
  @objc func dismissVC() {
    if let exitAction = self.exitAction {
      exitAction()
    }
  }
  
  func configure(with oEvent: Event?, exitAction:(()->Void)?) {
    if let event = oEvent {
      self.event = event
      // set activity label
      let activity = event.activity
      self.activityLabel.text = activity
      
      // set event image
      if let pictureUrl = event.absoluteImage {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        
        //ToDo: set a placeholder for the event Image
        let placeholder = UIImage(named: "46")
        self.eventImage.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
        {
          result in
          switch result {
          case .success(let value ):
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
          }
        }
      }
      // setup member avatars
      if let topMembers = event.group?.getTopMembers(topN: 5), topMembers.count > 0 {
        membersAvatarBar.configure(users: topMembers, tapAction: nil)
      }
      // set event description
      self.descriptionTextView.text = "Entrepreneur and businessman Bill Gates and his business partner Paul Allen founded and built the world's largest software business, Microsoft, through technological innovation, keen business strategy and aggressive business tactics. In the process, Gates became one of the richest men in the world. In February 2014, Gates announced that he was stepping down as Microsoft's chairman to focus on charitable work at his foundation, the Bill and Melinda Gates Foundation."
    }
    //set exit action
    self.exitAction = exitAction
  }

}

