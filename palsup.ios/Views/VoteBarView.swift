//
//  VoteBarView.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/30/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class VoteBarView: UIView {

    var acceptAction: (()->Void)?
    var rejectAction: (()->Void)?
    
    lazy var thumbsDownButton: UIButton = {
      let button = UIButton()
      button.backgroundColor = .clear
      button.addTarget(self, action:#selector(thumbsDownTapAction), for: .touchUpInside)
      button.setImage(UIImage(named: "cross"), for: .normal)
      return button
    }()
    
    lazy var thumbsUpButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(thumbsUpTapAction), for: .touchUpInside)
      button.backgroundColor = .clear
      button.setImage(UIImage(named: "high5"), for: .normal)
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
    
    func setupView() {
      self.addSubview(thumbsDownButton)
      self.addSubview(thumbsUpButton)
      setupLayout()
    }
    
    func setupLayout() {
      thumbsDownButton.translatesAutoresizingMaskIntoConstraints = false
      thumbsDownButton.snp.makeConstraints { (make)->Void in
        make.right.equalTo(self.snp.centerX).offset(-20)
        make.top.equalTo(self)
        make.bottom.equalTo(self)
        make.width.equalTo(self).multipliedBy(UIStyle.buttonWidthRatioMedium)
        make.height.equalTo(thumbsDownButton.snp.width)
      }
      
      thumbsUpButton.translatesAutoresizingMaskIntoConstraints = false
      thumbsUpButton.snp.makeConstraints { (make)->Void in
        make.left.equalTo(self.snp.centerX).offset(20)
        make.top.equalTo(self)
        make.bottom.equalTo(self)
        make.width.equalTo(self).multipliedBy(UIStyle.buttonWidthRatioMedium)
        make.height.equalTo(thumbsUpButton.snp.width)
      }
    }
    
    @objc func thumbsDownTapAction() {
      if let reject = self.rejectAction {
        reject()
      }
    }
    
    @objc func thumbsUpTapAction() {
      if let accept = self.acceptAction {
        accept()
      }
    }

}
