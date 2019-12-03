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
  
  var pal:GetPalsByActivityQuery.Data.GetPalsByActivity?
  
  var tapAction:((GetPalsByActivityQuery.Data.GetPalsByActivity?)->Void)?
  
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
      make.right.equalTo(self).offset(-20)
    }
  }
  
  @objc func handleTap(sender: UITapGestureRecognizer) {
    if let action = self.tapAction, let pal = self.pal {
      action(pal)
    }
  }
  
  func configure(with oPal: GetPalsByActivityQuery.Data.GetPalsByActivity?, tapAction action: ((GetPalsByActivityQuery.Data.GetPalsByActivity?)->Void)?) {
    if let pal = oPal {
      self.pal = pal
      // set name label
      if let username = pal.user?.name.fragments.nameFields {
        self.nameLabel.text = "\(username.first.capitalized)'s down for"
      }
      
      // set pal image
      if let pictureUrl = pal.user?.absolutePicture?.fragments.pictureFields.medium {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
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
      self.activityLabel.text = pal.activity.capitalized
      
      // set date label
      if let date = pal.date {
        let dateRange = DateRange(start:Int(date.fragments.dateRangeFields.startDate ?? "NIL"), end:Int(date.fragments.dateRangeFields.endDate ?? "NIL"))
        self.dateLabel.text =  (dateRange.displayDateFromNow() ?? "").capitalized
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
