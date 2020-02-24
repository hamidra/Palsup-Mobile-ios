//
//  EventHeaderView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/21/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import SwiftDate

class EventHeaderView: UIView {
  var event: Event?
  
  lazy var eventImage: CircleImageView = {
    var imageView = CircleImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.backgroundColor = UIColor.primaryColor
    imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .horizontal)
    imageView.setContentCompressionResistancePriority(UILayoutPriority.defaultLow, for: .vertical)
    
    return imageView
  }()
  
  lazy var activityLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.titleFontSize), weight: .bold)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  
  lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.contentFontSize), weight: .regular)
    label.textAlignment = .left
    label.textColor = .red
    return label
  }()
  
  lazy var locationLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: CGFloat(UIStyle.subtitleFontSize), weight: .semibold)
    label.textAlignment = .left
    label.textColor = .gray
    return label
  }()
  
  lazy var infoStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [dateLabel, activityLabel, locationLabel])
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
    return stackView
  }()

  lazy var membersAvatarBar: AvatarBarView = {
    let avatarBar = AvatarBarView()
    return avatarBar
  }()
  
  lazy var membersStack: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.alignment = .center
    
    let titleLabel = UILabel()
    titleLabel.text = "Attendees"
    titleLabel.textAlignment = .center
    
    stackView.addArrangedSubview(self.membersAvatarBar)
    stackView.addArrangedSubview(titleLabel)
    
    return stackView
  }()
  
  lazy var waitlistAvatarBar: AvatarBarView = {
    let avatarBar = AvatarBarView()
    return avatarBar
  }()
  
  lazy var waitlistStack: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillProportionally
    stackView.alignment = .center
    
    let titleLabel = UILabel()
    titleLabel.text = "Waitlist"
    titleLabel.textAlignment = .center
    
    stackView.addArrangedSubview(self.waitlistAvatarBar)
    stackView.addArrangedSubview(titleLabel)
    
    return stackView
  }()
  
  lazy var attendeesContainer: UIView = {
    let view = UIView()
    view.addSubview(membersStack)
    view.addSubview(waitlistStack)
    return view
  }()
  

  lazy var imageInfoContainer: UIStackView = {
    let container = UIStackView()
    container.axis = .horizontal
    container.contentMode = .center
    container.alignment = .center
    container.spacing = 20
    container.addArrangedSubview(eventImage)
    container.addArrangedSubview(infoStack)
    return container
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
    addSubview(imageInfoContainer)
    addSubview(attendeesContainer)
    setupLayout()
  }
  
  func setupLayout() {
    eventImage.translatesAutoresizingMaskIntoConstraints = false
    eventImage.snp.makeConstraints({make in
      make.width.equalTo(70)
      make.height.equalTo(eventImage.snp.width)
    })
    imageInfoContainer.translatesAutoresizingMaskIntoConstraints = false
    imageInfoContainer.snp.makeConstraints({make in
      make.top.equalTo(self.layoutMarginsGuide)
      make.centerX.equalTo(self.layoutMarginsGuide)
      make.height.equalTo(infoStack).priority(1)
      make.height.greaterThanOrEqualTo(eventImage)
      make.width.lessThanOrEqualToSuperview()
    })
    attendeesContainer.translatesAutoresizingMaskIntoConstraints = false
    attendeesContainer.snp.makeConstraints({make in
      make.top.equalTo(imageInfoContainer.snp.bottom)
      make.width.equalTo(self)
      //make.height.equalTo(40)
      make.bottom.equalTo(self)
    })
    membersStack.translatesAutoresizingMaskIntoConstraints = false
    membersStack.snp.makeConstraints({make in
      make.left.equalToSuperview()
      make.top.equalToSuperview()
      make.bottom.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.5)
    })
    membersAvatarBar.translatesAutoresizingMaskIntoConstraints = false
    membersAvatarBar.snp.makeConstraints({make in
      make.height.equalTo(40)
    })
    
    waitlistStack.translatesAutoresizingMaskIntoConstraints = false
    waitlistStack.snp.makeConstraints({make in
      make.right.equalToSuperview()
      make.top.equalToSuperview()
      make.bottom.equalToSuperview()
      make.width.equalToSuperview().multipliedBy(0.5)
    })
    waitlistAvatarBar.translatesAutoresizingMaskIntoConstraints = false
    waitlistAvatarBar.snp.makeConstraints({make in
      make.height.equalTo(40)
    })
    
  }

  func configure (oEvent: Event?, memberAction: (()->Void)?, waitlistAction: (()->Void)?) {
    if let event = oEvent {
      self.activityLabel.text = event.activity ?? ""
      if let startDateMs = Int(event.date?.startDate ?? "NIL") {
        let startDate = Date(milliseconds: startDateMs)
        self.dateLabel.text = startDate.toFormat("dd MMM yyyy 'at' HH:mm")
      } else {
        self.dateLabel.text = "Anytime"
      }
      var locationStr: String = ""
      locationStr += event.location?.address ?? ""
      if let city = event.location?.city {
        locationStr += locationStr != "" ? ",\(city)" : city
      }
      if let state = event.location?.state {
        locationStr += locationStr != "" ? ",\(state)" : state
      }
      self.locationLabel.text = locationStr
      
      // set eventImage
      if let imageUrl = event.absoluteImage {
        ImageDownloader.shared.setImage(imageView: eventImage, url: imageUrl)
      }
      
      // setup attendees stack
      if let topMembers = event.group?.getTopMembers(topN: 5), topMembers.count > 0 {
        membersAvatarBar.configure(users: topMembers, tapAction: memberAction)
      }
      if let topWaitlist = event.group?.getTopWaitlist(topN: 5), topWaitlist.count > 0 {
        waitlistAvatarBar.configure(users: topWaitlist, tapAction: waitlistAction)
      }
    }
  }
}
