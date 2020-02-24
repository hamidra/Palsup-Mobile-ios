//
//  InitialViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 12/20/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }
  
  override func viewDidAppear(_ animated: Bool) {
    if SignedInUser.Identity == nil {
      performSegue(withIdentifier: "toSignIn", sender: self)
    } else {
      performSegue(withIdentifier: "toMainView", sender: self)
    }
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
