//
//  ManagedKeyboardViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/15/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit

class ManagedKeyboardViewController: UIViewController {
    var keyBoardIsShown:Bool = false
  var closeKeyboard: (()->())? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      // add observers to move the view up if the keyboard is shown
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
  
  @objc func keyboardWillShow(notification: NSNotification) {
      if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
        
        if !self.keyBoardIsShown {
          self.keyBoardIsShown = true
          scrollView.snp.updateConstraints { (make) -> Void in
            make.bottom.equalTo(self.view).inset(keyboardSize.height)
          }
        }
      }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      scrollView.snp.updateConstraints { (make) -> Void in
        make.bottom.equalTo(self.view)
      }
      self.keyBoardIsShown = false
    }
  }

}
