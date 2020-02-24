//
//  CircleImageView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/14/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    //self.layer.masksToBounds = false
    self.clipsToBounds = true
    self.layer.cornerRadius = self.frame.height/2
  }
}
