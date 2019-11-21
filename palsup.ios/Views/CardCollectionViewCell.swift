//
//  CardCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/20/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
    
    self.contentView.layer.cornerRadius = bounds.size.width * CGFloat(0.05)
    self.contentView.layer.borderWidth = 1.0
    self.contentView.layer.borderColor = UIColor.clear.cgColor
    self.contentView.layer.masksToBounds = true
  }
}
