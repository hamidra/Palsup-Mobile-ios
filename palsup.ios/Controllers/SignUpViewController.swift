//
//  SignUpViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/17/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import Eureka
import Promises
import SwiftDate

class SignUpViewController: FormViewController {
  let genderMap = ["Man": Gender.male, "Woman": Gender.female]
  
  @objc func saveForm() {
    let genderMap = ["Man": Gender.male, "Woman": Gender.female]
    let values = form.values()
    if let first = values["firstName"] as? String, let last = values["lastName"] as? String, let dob = values["birthday"] as? Date, let email =  values["email"] as? String, let password = values["password"] as? String {
      let name = NameInput(first: first, last: last)
      let gender = genderMap[values["gender"] as? String ?? "NA"] ?? Gender.unknown
      let dobStr = dob.toFormat("yyyy-MM-dd")
      var user = UserInput(gender: gender, name: name, dob: dobStr)
      user.email = email
      user.password = password
      createUser(user: user).then({user in
        try SignedInUser.setUser(user: user)
        self.performSegue(withIdentifier: "toPhotoSignUp", sender: nil)
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
    var save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveForm))
    self.navigationItem.rightBarButtonItem = save
  }
  
  func setupForm() {
    form  +++
      Section() {
        let header = HeaderFooterView<UIView>(.callback({
          let imageView = UIImageView(image: UIImage(named: "communityBanner"))
          imageView.contentMode = .scaleAspectFit
          return imageView
        }))
        $0.header = header
        $0.header?.height = {100}
      }
      <<< TextRow("firstName"){ row in
        row.title = "First Name"
      }
      <<< TextRow("lastName"){ row in
        row.title = "Last Name"
      }
      <<< EmailRow("email"){ row in
        row.title = "Email"
      }
      <<< PasswordRow("password"){ row in
        row.title = "Password"
      }
      <<< DateRow("birthday"){ row in
        row.title = "Birthday"
        row.value = Date() - 18.years
      }
      <<< PushRow<String>("gender") { row in
        row.title = "Gender"
        row.options = ["Man", "Woman", "NA"]
        row.value = "NA"
      }
        <<< ButtonRow() { row in
          row.title = "Reset"
          row.onCellSelection() {cell, row in
            self.form.setValues(["firstName": "", "lastName": "", "email": "", "password": "", "birthday": ""])
            self.tableView.reloadData()
          }
        }
    animateScroll = true
    rowKeyboardSpacing = 20
  }
}

extension SignUpViewController {
  func createUser(user:UserInput) -> Promise<User> {
    return Promise<User> { fulfill, reject in
      let decoder = JSONDecoder()
      // Create user
      let gqlCreateUser = CreateUserMutation(user: user)
      GqlClient.shared.client.perform(mutation: gqlCreateUser) { result in
        switch result {
        case .success(let gqlResult):
          if let userJson = gqlResult.data?.createUser?.jsonObject {
            do {
              let userData = try JSONSerialization.data(withJSONObject: userJson, options: [])
              let user =  try decoder.decode(User.self, from: userData )
              fulfill(user)
            } catch {
              print("Error happened in deserialization of User, error:\(error)")
              reject(error)
            }
          } else {
            print("CreateUserMutation returned no created user")
            reject(GenericError("CreateUserMutation returned no created user"))
          }
        case .failure(let error):
          reject(error)
        }
      }
    }
  }
}
