//
//  CircleLabel.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/27/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class CircleLabel: UILabel {

    override func layoutSubviews() {
      super.layoutSubviews()
      
      //self.layer.masksToBounds = false
      self.clipsToBounds = true
      self.layer.cornerRadius = self.frame.height/2
    }
}
