//
//  PalCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/30/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftDate
import SnapKit

class PalCollectionViewCell: CardCollectionViewCell {
  
  var pal:Pal?
  var tapAction:((Pal?)->Void)?
  
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.textAlignment = .left
    label.textColor = .white
    return label
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
  lazy var palImage: UIImageView = {
    let image = UIImageView()
    image.backgroundColor = UIColor.clear
    image.contentMode = .scaleAspectFit
    return image
  }()
  lazy var palInfoStack:UIStackView = {
    let stack = UIStackView(arrangedSubviews: [nameLabel, activityLabel, dateLabel])
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
    return button
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
    self.contentView.addSubview(palImage)
    self.contentView.addSubview(palInfoStack)
    self.contentView.addSubview(likeButton)
    setupLayout()
  }
  
  private func setupLayout() {
    palImage.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(self).offset(0)
      make.top.equalTo(self).offset(0)
      make.bottom.equalTo(self).offset(0)
      make.right.equalTo(self).offset(0)
    }
    palInfoStack.snp.makeConstraints { (make) -> Void in
      make.bottom.equalTo(self).offset(-20)
      make.left.equalTo(self).offset(20)
      make.right.equalTo(likeButton.snp.left).offset(-20)
    }
    likeButton.snp.makeConstraints{(make) -> Void in
      make.right.equalTo(self).offset(-20)
      make.bottom.equalTo(self).offset(-20)
    }
  }
  
  @objc func handleTap(sender: UITapGestureRecognizer) {
    if let action = self.tapAction, let pal = self.pal {
      action(pal)
    }
  }
  
  func configure(with oPal: Pal?, tapAction action: ((Pal?)->Void)?) {
    if let pal = oPal {
      self.pal = pal
      // set name label
      if let firstname = pal.user?.name?.first {
        self.nameLabel.text = "\(firstname.capitalized)'s down for"
      }
      
      // set pal image
      if let pictureUrl = pal.user?.absolutePicture?.medium {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader
        
        // ToDO[Security]: remove in production release
        // Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        self.palImage.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
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
      self.activityLabel.text = pal.activity?.capitalized
      
      // set date label
      if let date = pal.date {
        let dateRange = DateRange(start:Int(date.startDate ?? "NIL"), end:Int(date.endDate ?? "NIL"))
        self.dateLabel.text =  (dateRange.displayDateFromNow() ?? "").capitalized
      } else {
        self.dateLabel.text =  "Anytime"
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
