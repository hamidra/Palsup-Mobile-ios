//
//  SignUpViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/13/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import Eureka
import CropViewController
import Promises
import Kingfisher

class EditProfileViewController: FormViewController {
  let genderMap = ["Man": Gender.male, "Woman": Gender.female]
  var imagePickerCrop: ImagePickerCropController?
  
  lazy var profileImageView: CircleImageView = {
    var imageView = CircleImageView()
    imageView.backgroundColor = UIColor.blue
    imageView.contentMode = .scaleAspectFit
    
    // make it tappable
    imageView.isUserInteractionEnabled = true
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
    imageView.addGestureRecognizer(tapRecognizer)
    
    return imageView
  }()

  lazy var profileImageContainer: UIView = {
    var view:UIView = UIView()
    let padding = CGFloat(10)
    view.layoutMargins = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    view.addSubview(self.profileImageView)
    return view
  }()
  
  @objc func openImagePicker() {
    imagePickerCrop?.present(from: profileImageView)
  }
  
  @objc func saveForm() {
    if let user = SignedInUser.Identity, let userId = user.id {
      let values = form.values()
      if let first = values["firstName"] as? String, let last = values["lastName"] as? String, let dob = values["birthday"] as? Date, let email =  values["email"] as? String{
        let name = NameInput(first: first, last: last)
        let gender = genderMap[values["gender"] as? String ?? "NA"] ?? Gender.unknown
        let dobStr = dob.toFormat("yyyy-MM-dd")

        let work = WorkInput(title: values["title"] as? String ?? "", organization: values["company"] as? String ?? "")
        let education = EducationInput(school: values["school"] as? String ?? "", class: values["class"] as? String ?? "")
        
        var userInput = UserInput()
        userInput.name = name
        userInput.email = email
        userInput.gender = gender
        userInput.dob = dobStr
        userInput.work = [work]
        userInput.education = [education]
        if let bio = values["bio"] as? String {
          userInput.bio = bio
        }
        GqlApiProvider.updateUser(id: userId, user: userInput).then({user in
        try SignedInUser.setUser(user: user)
          self.navigationController?.popViewController(animated: true)
        }).catch({error in
          print("error: \(error) happened while signing up the user.")
        })
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePickerCrop = ImagePickerCropController(presentationController: self, cropDelegate: self)
    setupView()
    
    // Do any additional setup after loading the view.
  }
  
  func setupView() {
    setupForm()
    let save = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveForm))
    self.navigationItem.rightBarButtonItem = save
    setupLayout()
  }
  
  func setupForm() {
    form  +++
        Section() {
          let header = HeaderFooterView<UIView>(.callback({
            return self.profileImageContainer
          }))
          $0.header = header
          $0.header?.height = {100}
        }
        <<< ButtonRow() { row in
          row.title = "Sign Out"
          row.onCellSelection() {cell, row in
            self.signout()
          }
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
        }
        +++
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
          row.title = "Company"
        }
        <<< TextRow("title"){ row in
          row.title = "Title"
        }
        <<< ButtonRow() { row in
          row.title = "Reset"
          row.onCellSelection() {cell, row in
            self.resetForm()
          }
        }
    resetForm()
    animateScroll = true
    rowKeyboardSpacing = 20
  }
  
  func resetForm() {
    if let user = SignedInUser.Identity {
      var dob: Date? = nil
      var education:Education? = nil
      var work: Work? = nil
      if let edCount = user.education?.count, edCount > 0 {
        education = user.education![0]
      }
      if let workCount = user.work?.count, workCount > 0 {
        work = user.work![0]
      }
      if let dobMilliSeconds = Int(user.dob ?? "NIL") {
        dob = Date(milliseconds: dobMilliSeconds)
      }
      
      self.form.setValues(["firstName": user.name?.first ?? "", "lastName": user.name?.last ?? "", "email": user.email ?? "", "password": "", "birthday": dob ?? ""])
      self.form.setValues(["bio": user.bio ?? "", "school": education?.school ?? "", "class": education?.classOf ?? "", "company": work?.organization ?? "", "title": work?.title ?? ""])
      self.tableView.reloadData()
      
      // reset profile image
      if let pictureUrl = user.absolutePicture?.medium {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader
        
        // ToDO[Security]: remove in production release
        // Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        self.profileImageView.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader), .targetCache(SignedInUser.profileImageCache)])
        {
          result in
          switch result {
          case .success(let value):
            print("Task done for: \(value.source.url?.absoluteString ?? "") cache: \(value.cacheType) size: \(value.image.cacheCost)")
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
          }
        }
      }
    }
  }
  
  func signout() {
    SignedInUser.signOut()
    let initialViewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InitialVC") as UIViewController
    self.show(initialViewController, sender: nil)
  }
  
  func setupLayout() {
    self.profileImageView.snp.makeConstraints({make in
      make.center.equalTo(profileImageContainer.layoutMarginsGuide)
      make.height.equalTo(profileImageContainer.layoutMarginsGuide)
      make.width.equalTo(profileImageView.snp.height)
    })
  }
}

extension EditProfileViewController: CropViewControllerDelegate {
  func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
    self.profileImageView.image = image
    cropViewController.dismiss(animated: false, completion: nil)
    
    ImageUploader.shared.uploadProfileImage(image: image).then({ data in
      if let responseData = data, var user = SignedInUser.Identity {
        let decoder = JSONDecoder()
        let picture = try decoder.decode(Picture.self, from: responseData)
        
        // update user with picture
        user.picture = picture
        try SignedInUser.setUser(user: user)
      }
    }).catch { (error) in
      print(error)
    }
  }
}
