//
//  EventCollectionViewCell.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/29/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class EventCollectionViewCell2: UICollectionViewCell {

  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }
  
  /*func configure(with oEvent: GetEventsByActivityQuery.Data.GetEventsByActivity?) {
    if let event = oEvent{
      
      // set event image
      if let pictureUrl = event.absoluteImage {
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
      self.activityLabel.text = event.activity
      
      // set date label
      if let date = event.date {
        let dateRange = DateRange(start:Int(date.fragments.dateRangeFields.startDate ?? "NIL"), end:Int(date.fragments.dateRangeFields.endDate ?? "NIL"))
        self.dateLabel.text = dateRange.displayDateFromNow() ?? ""
      }
    }
  }*/

}
