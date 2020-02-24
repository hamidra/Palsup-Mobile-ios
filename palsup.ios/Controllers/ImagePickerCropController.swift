//
//  ImagePickerCropController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/1/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import UIKit
import CropViewController

class ImagePickerCropController: NSObject {
  var imagePicker: ImagePickerController? = nil
  var cropControllerDelegate: CropViewControllerDelegate? = nil
  var presentationViewController: UIViewController? = nil
  
  public convenience init(presentationController: UIViewController, cropDelegate: CropViewControllerDelegate) {
    self.init()
    self.presentationViewController = presentationController
    self.cropControllerDelegate = cropDelegate
    self.imagePicker = ImagePickerController(presentationController: presentationController, imagePickerDelegate: self)
  }
  
  public func present(from view: UIView) {
    imagePicker?.present(from: view)
  }
}

extension ImagePickerCropController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    imagePicker?.dismiss() {
      if let image = info[.originalImage] as? UIImage {
        let cropController = CropViewController(croppingStyle: .circular, image: image)
        cropController.delegate = self.cropControllerDelegate
        self.presentationViewController?.present(cropController, animated: false)
      }
    }
  }
}
