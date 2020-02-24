//
//  ImagePickerController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 12/28/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class ImagePickerController {

  var imagePickerController: UIImagePickerController? = nil
  var presentationViewController : UIViewController? = nil

  public convenience init(presentationController: UIViewController, imagePickerDelegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
    self.init()
    self.presentationViewController = presentationController
    
    self.imagePickerController = UIImagePickerController()
    self.imagePickerController?.delegate = imagePickerDelegate
    self.imagePickerController?.allowsEditing = false
    self.imagePickerController?.mediaTypes = ["public.image"]
  }

  private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
    guard UIImagePickerController.isSourceTypeAvailable(type) else {
      return nil
    }
      
    if let imagePicker = self.imagePickerController, let presentationVC = self.presentationViewController {
      return UIAlertAction(title: title, style: .default) { _ in
          imagePicker.sourceType = type
          presentationVC.present(imagePicker, animated: true)
      }
    } else {
      return nil
    }
  }
  
  public func present(from sourceView: UIView) {

    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

    if let action = self.action(for: .camera, title: "Take photo") {
        alertController.addAction(action)
    }
    if let action = self.action(for: .photoLibrary, title: "Choose Photo") {
        alertController.addAction(action)
    }

    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

    if UIDevice.current.userInterfaceIdiom == .pad {
        alertController.popoverPresentationController?.sourceView = sourceView
        alertController.popoverPresentationController?.sourceRect = sourceView.bounds
        alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
    }

    self.presentationViewController?.present(alertController, animated: true)
  }
  
  public func dismiss(completion: (()->Void)?) {
    self.imagePickerController?.dismiss(animated: false, completion: completion)
  }
}

