//
//  SearchButton.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/5/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

@IBDesignable class SearchButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  func setupView() {
    self.setTitleColor(UIColor.systemBlue, for: .normal)
    layer.borderColor = UIColor.systemBlue.cgColor
    layer.borderWidth = 1
    layer.cornerRadius = 10
  }
}
