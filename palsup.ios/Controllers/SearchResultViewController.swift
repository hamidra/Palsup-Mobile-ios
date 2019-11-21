//
//  SearchResultViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/14/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
  
  @IBOutlet weak var palsCollectionView: UICollectionView!
  @IBOutlet weak var eventsCollectionView: UICollectionView!
  
  @IBAction func switchView(_ segment: UISegmentedControl) {
    switch segment.selectedSegmentIndex {
      case 0:
        palsCollectionView.isHidden = false
        eventsCollectionView.isHidden = true
      case 1:
        palsCollectionView.isHidden = true
        eventsCollectionView.isHidden = false
      default:
        break
    }
  }
  
  var eventsByActivity:[GetEventsByActivityQuery.Data.GetEventsByActivity?]? {
    didSet {
      eventsCollectionView.reloadData()
    }
  }
  var palsByActivity:[GetPalsByActivityQuery.Data.GetPalsByActivity?]? {
    didSet {
      palsCollectionView.reloadData()
    }
  }
  var searchFilter:SearchFilter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //register the cells
    palsCollectionView.register(PalCollectionViewCell.self, forCellWithReuseIdentifier: "PalCollectionViewCell")
    
    eventsCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "EventCollectionViewCell")
    
    
    //query the results
    if let filter = searchFilter {
      print("\(filter.activity!) \n from: \(filter.date?.startDate) \n to: \(filter.date?.endDate)")
      let gqlActivityFilter = ActivityFilterInput(activity: filter.activity)
      
      // Query Pals by Activity
      let gqlGetPalsByActivityQuery = GetPalsByActivityQuery(userId: nil, activityFilter:gqlActivityFilter)
      GqlClient.shared.client.fetch(query: gqlGetPalsByActivityQuery) {
        result in
        switch result {
        case .success(let gqlResult):
          self.palsByActivity = gqlResult.data?.getPalsByActivity
        case .failure(let error):
          print(error)
        }
      }
      
      // Query Events by Activity
      let gqlGetEventsByActivityQuery = GetEventsByActivityQuery(userId: nil, activityFilter:gqlActivityFilter)
      GqlClient.shared.client.fetch(query: gqlGetEventsByActivityQuery){
        result in
        switch result {
        case .success(let gqlResult):
          self.eventsByActivity = gqlResult.data?.getEventsByActivity
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showUserDetail" {
      if let vc = segue.destination as? UserInfoViewController, let pal = sender as? GetPalsByActivityQuery.Data.GetPalsByActivity {
        vc.pal = pal
      }
      else
      {
        print("not happening")
      }
    } else if segue.identifier == "showEventDetail" {
      if let vc = segue.destination as? EventInfoViewController, let event = sender as? GetEventsByActivityQuery.Data.GetEventsByActivity {
        vc.event = event
      }
      else
      {
        print("not happening")
      }
    }
  }
  
  func palCellTapAction(oPal: GetPalsByActivityQuery.Data.GetPalsByActivity?){
    if let pal = oPal {
      performSegue(withIdentifier: "showUserDetail", sender: pal)
    }
  }
  
  func eventCellTapAction(oEvent: GetEventsByActivityQuery.Data.GetEventsByActivity?){
    if let event = oEvent {
      performSegue(withIdentifier: "showEventDetail", sender: event)
    }
  }
}

extension SearchResultViewController : UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == palsCollectionView {
      return palsByActivity?.count ?? 0
    } else {
      return eventsByActivity?.count ?? 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == palsCollectionView {
      let palCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PalCollectionViewCell", for: indexPath) as! PalCollectionViewCell
      palCell.configure(with: palsByActivity?[indexPath.item], tapAction:palCellTapAction)
      return palCell
    } else {
      let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCollectionViewCell", for: indexPath) as! EventCollectionViewCell
      eventCell.configure(with: eventsByActivity?[indexPath.item], tapAction:eventCellTapAction)
      return eventCell
    }
  }
}
