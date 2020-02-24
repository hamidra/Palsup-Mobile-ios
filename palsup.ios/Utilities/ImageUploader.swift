//
//  Uploader.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/3/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation
import Alamofire
import Promises
import UIKit

public enum ImageFormat: String {
  case jpeg = "image/jpeg"
  case png = "image/png"
}

public class ImageUploader {
  static let shared = ImageUploader()
  
  private(set) var format: ImageFormat = .jpeg
  
  func getUserUrl() -> String? {
    if let userId = (SignedInUser.Identity?.id) {
      return "\(Settings.backendURL)/uploader/user/\(userId)"
    } else {
      print("userId is nil, can't upload an image to the user profile")
      return nil
    }
  }
  
  func getEventUrl(eventId: String) -> String? {
    return "\(Settings.backendURL)/uploader/event/\(eventId)"
  }
  
  public func uploadProfileImage(image: UIImage) -> Promise<Data?> {
    return self.upload(image: image, endpointUrl: getUserUrl(), withName: "profilePic")
  }
  
  public func uploadEventImage(image: UIImage, eventId: String) -> Promise<Data?> {
    return self.upload(image: image, endpointUrl: getEventUrl(eventId: eventId), withName: "eventPic")
  }
  
  public func upload(image: UIImage, endpointUrl: String?, withName: String) -> Promise<Data?> {
    return Promise<Data?> { fulfill, reject in
      if let imageData = image.jpegData(compressionQuality: 0.0), let url = endpointUrl {
        let fileName = UUID().uuidString.replacingOccurrences(of: "-", with: "")
        AF.upload(multipartFormData: { multipartFormData in
          multipartFormData.append(imageData, withName: withName, fileName:fileName , mimeType: self.format.rawValue )
        },
        to: url).response { res in
          print(String(decoding: res.request?.httpBody ?? Data(), as: UTF8.self))
          switch res.result {
          case .success(let data):
              fulfill(data)
          case .failure(let error):
              reject(error)
          }
        }
      } else {
        print("imageData or url are nil")
        reject(GenericError("imageData or url are nil"))
      }
    }
  }
}
