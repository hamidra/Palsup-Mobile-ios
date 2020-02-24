//
//  SignUpBioViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/18/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import Eureka
import Promises

class SignUpBioViewController: FormViewController {
  
  lazy var saveBarButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveForm))
    return barButton
  }()
  
  @objc func saveForm() {
    if let user = SignedInUser.Identity, let userId = user.id {
      let values = form.values()
      let work = WorkInput(title: values["title"] as? String ?? "", organization: values["company"] as? String ?? "")
      let education = EducationInput(school: values["school"] as? String ?? "", class: values["class"] as? String ?? "")
      
      var userInput = UserInput()
      if let bio = values["bio"] as? String {
        userInput.bio = bio
      }
      userInput.work = [work]
      userInput.education = [education]
      GqlApiProvider.updateUser(id: userId, user: userInput).then({user in
        try SignedInUser.setUser(user: user)
        self.performSegue(withIdentifier: "toInitial", sender: nil)
        }).catch({error in
          print("error: \(error) happened while signing up the user.")
        })
    }
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    setupForm()
    self.navigationItem.rightBarButtonItem = self.saveBarButton
  }
  
  func setupForm() {
    form +++
      Section("Bio")
      <<< TextAreaRow("bio"){ row in
        row.title = "Bio"
      }
      +++
      Section("Education")
      <<< TextRow("school"){ row in
        row.title = "School"
      }
      <<< TextRow("class"){ row in
        row.title = "Class Of"
      }
      +++
      Section("Work")
      <<< TextRow("company"){ row in
        row.title = "company"
      }
      <<< TextRow("title"){ row in
        row.title = "Title"
      }
      +++
      Section()
        <<< ButtonRow() { row in
          row.title = "Reset"
          row.onCellSelection() {cell, row in
            self.form.setValues(["bio": "", "school": "", "class": "", "company": "", "title": ""])
            self.tableView.reloadData()
          }
        }
    animateScroll = true
    rowKeyboardSpacing = 20
  }
}
