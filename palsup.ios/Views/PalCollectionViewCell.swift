//
//  PalCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/20/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class PalCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configure(with name: NameFields!) {
    nameLabel.text = "\(name.first) \(name.last)"
  }
  
}
