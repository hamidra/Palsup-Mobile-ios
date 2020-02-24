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
  
  var event: GetEventsByActivityQuery.Data.GetEventsByActivity?
  var tapAction: ((GetEventsByActivityQuery.Data.GetEventsByActivity?)->Void)?
  
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
      make.right.equalTo(self).offset(-20)
    }
  }
  
  @objc func handleTap(sender: UITapGestureRecognizer) {
    if let action = self.tapAction, let event = self.event {
      action(event)
    }
  }
  
  func configure(with oEvent: GetEventsByActivityQuery.Data.GetEventsByActivity?, tapAction action: ((GetEventsByActivityQuery.Data.GetEventsByActivity?)->Void)?) {
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
      self.activityLabel.text = event.activity.capitalized
      
      // set date label
      if let date = event.date {
        let dateRange = DateRange(start:Int(date.fragments.dateRangeFields.startDate ?? "NIL"), end:Int(date.fragments.dateRangeFields.endDate ?? "NIL"))
        self.dateLabel.text = (dateRange.displayDateFromNow() ?? "").capitalized
      } else {
        self.dateLabel.text = "Anytime"
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
