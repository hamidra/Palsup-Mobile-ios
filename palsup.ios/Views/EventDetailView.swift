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

  lazy var activityLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.textAlignment = .left
    label.textColor = .black
    return label
  }()
  lazy var eventImage: UIImageView = {
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
    let stack = UIStackView(arrangedSubviews: [eventImage, exitButton])
    stack.alignment = .trailing
    stack.distribution = .fill
    stack.contentMode = .bottomRight
    stack.axis = .vertical
    return stack
  }()
  lazy var eventInfoStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [activityLabel])
    stack.alignment = .leading
    stack.distribution = .fill
    stack.contentMode = .scaleToFill
    stack.axis = .vertical
    return stack
  }()
  
  var event: GetEventsByActivityQuery.Data.GetEventsByActivity?
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
    addSubview(eventInfoStack)
    setupLayout()
  }
  
  private func setupLayout() {
    eventImage.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(imageStack).offset(0)
      make.left.equalTo(imageStack).offset(0)
      make.right.equalTo(imageStack).offset(0)
      make.height.greaterThanOrEqualTo(self).multipliedBy(0.5)
    }
    exitButton.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(eventImage.snp.bottom).offset(-20)
      make.right.equalTo(imageStack).offset(-20)
    }
    imageStack.snp.makeConstraints { (make) -> Void in
      make.top.equalTo(self).offset(20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(self).offset(-20)
    }
    eventInfoStack.snp.makeConstraints { (make) -> Void in
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
  
  func configure(with oEvent: GetEventsByActivityQuery.Data.GetEventsByActivity?, exitAction:(()->Void)?) {
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
    }
    //set exit action
    self.exitAction = exitAction
  }

}

