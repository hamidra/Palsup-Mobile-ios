//
//  EventInfoViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/31/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import SnapKit

class EventInfoViewController: UIViewController {

  lazy var eventDetailView: EventDetailView = {
    return EventDetailView()
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView(){
    eventDetailView.configure(with: event, exitAction: dismissVC)
    self.view.addSubview(eventDetailView)
    setupLayout()
  }
  
  func setupLayout() {
    eventDetailView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
  }
  
  var event:GetEventsByActivityQuery.Data.GetEventsByActivity?
  
  func dismissVC() {
    self.dismiss(animated: true)
  }
}
