//
//  notificationBadgeView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/24/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

public class NotificationBadgeView: UIView {
  
  var count: Int = 0 {
    didSet {
      var text : String
      if count > 0 {
        if count > 99 {
          text = "99+"
        } else {
          text = "\(count)"
        }
        countLabel.snp.updateConstraints({(maker) -> Void in
          let width = max(Double(text.count) * 0.7 * 25, 25)
          maker.width.equalTo(width)
        })
        countLabel.text = text
        countLabel.isHidden = false
      } else {
        countLabel.isHidden = true
        countLabel.snp.updateConstraints({(maker) -> Void in
          maker.width.equalTo(0)
        })
      }
    }
  }
  
  var isNew: Bool = false {
    didSet {
      newLabel.isHidden = !isNew
    }
  }
  
  lazy var newLabel: UILabel = {
    var label = CircleLabel()
    label.backgroundColor = UIColor.systemRed
    label.textColor = UIColor.white
    label.textAlignment = .center
    label.text = "new"
    
    return label
  }()
  
  lazy var countLabel: UILabel = {
    var label = CircleLabel()
    label.backgroundColor = UIColor.systemRed
    label.textColor = UIColor.white
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  func setupView() {
    self.addSubview(newLabel)
    self.addSubview(countLabel)
    setupLayout()
  }
  
  func setupLayout() {
    newLabel.snp.makeConstraints({ (make)->Void in
      make.centerY.equalTo(self)
      make.height.equalTo(25)
      make.width.equalTo(25*2)
    })
    countLabel.snp.makeConstraints({ (make)->Void in
      make.right.equalTo(self)
      make.left.equalTo(newLabel.snp.right).offset(3)
      make.height.equalTo(25)
      make.width.equalTo(25)
      make.centerY.equalTo(self)
    })
  }
}
