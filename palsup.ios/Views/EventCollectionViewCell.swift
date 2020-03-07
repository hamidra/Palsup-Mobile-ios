//
//  EventCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/30/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftDate
import SnapKit

class EventCollectionViewCell: CardCollectionViewCell {
  var event: Event?
  
  lazy var membersAvatarBar: AvatarBarView = {
    let avatarBar = AvatarBarView()
    return avatarBar
  }()
  
  lazy var activityLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.textAlignment = .left
    label.textColor = .white
    return label
  }()
  lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.textAlignment = .left
    label.textColor = .white
    return label
  }()
  lazy var eventImage: UIImageView = {
    let image = UIImageView()
    image.backgroundColor = UIColor.clear
    image.contentMode = .scaleAspectFit
    return image
  }()
  lazy var eventInfoStack:UIStackView = {
    let stack = UIStackView(arrangedSubviews: [activityLabel, dateLabel])
    stack.alignment = .leading
    stack.distribution = .fill
    stack.contentMode = .scaleToFill
    stack.axis = .vertical
    return stack
  }()
  lazy var likeButton: UIButton = {
    let button = UIButton()
    button.setTitle("🤙", for: .normal)
    button.backgroundColor = UIColor.systemRed
    button.showsTouchWhenHighlighted = true
    button.addTarget(self, action: #selector(handleLikeTap), for: .touchUpInside)
    return button
  }()
  
  var tapAction: ((Event?)->Void)?
  
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
    self.contentView.addSubview(eventImage)
    self.contentView.addSubview(eventInfoStack)
    self.contentView.addSubview(membersAvatarBar)
    self.contentView.addSubview(likeButton)
    setupLayout()
  }
  
  func setupLayout() {
    eventImage.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(self).offset(0)
      make.top.equalTo(self).offset(0)
      make.bottom.equalTo(self).offset(0)
      make.right.equalTo(self).offset(0)
    }
    eventInfoStack.snp.makeConstraints { (make) -> Void in
      make.bottom.equalTo(self).offset(-20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(likeButton.snp.left).offset(-20)
    }
    membersAvatarBar.snp.makeConstraints {(make) -> Void in
      make.top.equalTo(self).offset(20)
      make.left.equalTo(self).offset(20)
      make.height.equalTo(40)
    }
    likeButton.snp.makeConstraints{(make) -> Void in
      make.right.equalTo(self).offset(-20)
      make.bottom.equalTo(self).offset(-20)
    }
  }
  
  @objc func handleTap(sender: UITapGestureRecognizer) {
    if let action = self.tapAction, let event = self.event {
      action(event)
    }
  }
  
  @objc func handleLikeTap() {
    if let event = self.event, let eventId = event.id, let currentUserId=SignedInUser.Identity?.id {
      GqlApiProvider.addToEventsWaitlist(eventId: eventId, userId: currentUserId)
    } else {
      //ToDO: redirect to signIn page
      print("No user is logged in")
    }
  }
  
  func configure(with oEvent: Event?, tapAction action: ((Event?)->Void)?) {
    if let event = oEvent{
      self.event = event
      // set event image
      if let pictureUrl = event.absoluteImage {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        self.eventImage.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
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
      
      // set activity label
      self.activityLabel.text = event.activity?.capitalized ?? ""
      
      // set date label
      if let date = event.date {
        let dateRange = DateRange(start:Int(date.startDate ?? "NIL"), end:Int(date.endDate ?? "NIL"))
        self.dateLabel.text = (dateRange.displayDateFromNow() ?? "").capitalized
      } else {
        self.dateLabel.text = "Anytime"
      }
      // setup member avatars
      if let topMembers = event.group?.getTopMembers(topN: 5), topMembers.count > 0 {
        membersAvatarBar.configure(users: topMembers, tapAction: nil)
      }
      // set tap action
      if action != nil {
        self.tapAction = action
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.handleTap))
        self.addGestureRecognizer(gesture)
      }
    }
  }
}
