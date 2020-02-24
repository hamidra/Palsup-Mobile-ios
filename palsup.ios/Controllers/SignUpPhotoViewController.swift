//
//  PhotoUploadViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/18/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import CropViewController


class SignUpPhotoViewController: UIViewController {

  var imagePickerCrop: ImagePickerCropController?

  lazy var saveBarButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveForm))
    barButton.title = "skip"
    return barButton
  }()
  
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
  
  @objc func openImagePicker() {
    imagePickerCrop?.present(from: profileImageView)
  }
  
  @objc func saveForm() {
    if let image = profileImageView.image {
      ImageUploader.shared.uploadProfileImage(image: image).then({data in
        if let responseData = data, var user = SignedInUser.Identity {
          let decoder = JSONDecoder()
          let picture = try decoder.decode(Picture.self, from: responseData)
          
          // update user with picture
          user.picture = picture
          try SignedInUser.setUser(user: user)
          self.performSegue(withIdentifier: "toBioSignUp", sender: nil)
        }
      }).catch { (error) in
        print(error)
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
    self.navigationItem.rightBarButtonItem = self.saveBarButton
    self.view.addSubview(profileImageView)
    setupLayout()
  }
  
  func setupLayout() {
    self.profileImageView.snp.makeConstraints({make in
      make.center.equalTo(self.view)
      make.width.equalTo(self.view).inset(50)
      make.height.equalTo(profileImageView.snp.width)
    })
  }
}

extension SignUpPhotoViewController: CropViewControllerDelegate {
  func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
    profileImageView.image = image
    cropViewController.dismiss(animated: false, completion: nil)
  }
}
