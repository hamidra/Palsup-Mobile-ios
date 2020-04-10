//
//  ImageDownloader.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 1/22/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Promises

class ImageDownloader {
  public static var shared = ImageDownloader()
  
  public func setImage(imageView: UIImageView, url: String) -> Promise<Any> {
    return Promise<Any> { fulfill, reject in
      let src = URL(string: url)
      let downloader = KingfisherManager.shared.downloader
      //Downloader needs to be configured to accept untrusted certificates
      downloader.trustedHosts = Set(["localhost"])
      let placeholder = UIImage(named: "46")
      imageView.kf.setImage(with: src, placeholder: placeholder, options: [.downloader(downloader)])
      {
        result in
        switch result {
        case .success(let value):
          print("Task done for: \(value.source.url?.absoluteString ?? "")")
          fulfill(value)
        case .failure(let error):
          print("Job failed: \(error.localizedDescription)")
          reject(error)
        }
      }
    }
  }
  
  public func retrieveImage(url: String) -> Promise<UIImage> {
    return Promise<UIImage> { fulfill, reject in
      if let src = URL(string: url) {
        let downloader = KingfisherManager.shared.downloader
        //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        KingfisherManager.shared.retrieveImage(with: src, options: [.downloader(downloader)]) {result in
          switch result {
          case .success(let value):
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
            fulfill(value.image)
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
            reject(error)
          }
        }
      } else {
        reject(GenericError("Resource is not a valid url"))
      }
    }
  }
}
