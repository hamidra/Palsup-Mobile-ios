//
//  SearchButton.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/5/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

@IBDesignable class SearchButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: Int = 0 {
        didSet {
            layer.borderWidth = CGFloat(borderWidth)
        }
    }
    
    @IBInspectable var cornerWidthRatio: Float = 0 {
        didSet{
            layer.cornerRadius = bounds.size.width * CGFloat(cornerWidthRatio)
        }
    }
    
}
