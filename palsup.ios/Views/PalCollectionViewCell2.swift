//
//  PalCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/20/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftDate

class PalCollectionViewCell2: UICollectionViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var activityLabel: UILabel!
  @IBOutlet weak var palImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func configure(with oPal: GetPalsByActivityQuery.Data.GetPalsByActivity?) {
    if let pal = oPal{
      // set name label
      if let username = pal.user?.name.fragments.nameFields {
        self.nameLabel.text = "\(username.first)'s down for"
      }
      
      // set pal image
      if let pictureUrl = pal.user?.absolutePicture?.fragments.pictureFields.medium {
        let url = URL(string: pictureUrl)
        let downloader = KingfisherManager.shared.downloader //Downloader needs to be configured to accept untrusted certificates
        downloader.trustedHosts = Set(["localhost"])
        let placeholder = UIImage(named: "46")
        self.palImage.kf.setImage(with: url, placeholder: placeholder ,options: [.downloader(downloader)])
        {
          result in
          switch result {
          case .success(let value):
            print("Task done for: \(value.source.url?.absoluteString ?? "")")
          case .failure(let error):
            print("Job failed: \(error.localizedDescription)")
          }
        }
      }
      
      // set activity label
      self.activityLabel.text = pal.activity
      
      // set date label
      if let date = pal.date {
        let dateRange = DateRange(start:Int(date.fragments.dateRangeFields.startDate ?? "NIL"), end:Int(date.fragments.dateRangeFields.endDate ?? "NIL"))
        self.dateLabel.text = dateRange.displayDateFromNow() ?? ""
      }
    }
  }
}

