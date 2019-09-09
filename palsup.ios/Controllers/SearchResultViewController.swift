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
    palsCollectionView.register(UINib.init(nibName: "PalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PalCollectionViewCell")
    
    eventsCollectionView.register(UINib.init(nibName: "PalCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventCollectionViewCell")
    
    
    //query the results
    if let filter = searchFilter {
      print("\(filter.activity!) \n from: \(filter.date?.startDate) \n to: \(filter.date?.endDate)")
      var gqlActivityFilter = ActivityFilterInput(activity: filter.activity)
      
      // Query Pals by Activity
      var gqlGetPalsByActivityQuery = GetPalsByActivityQuery(userId: nil, activityFilter:gqlActivityFilter)
      GqlCient.shared.client.fetch(query: gqlGetPalsByActivityQuery){
        result in
        switch result {
        case .success(let gqlResult):
          self.palsByActivity = gqlResult.data?.getPalsByActivity
        case .failure(let error):
          print(error)
        }
      }
      
      // Query Events by Activity
      var gqlGetEventsByActivityQuery = GetEventsByActivityQuery(userId: nil, activityFilter:gqlActivityFilter)
      GqlCient.shared.client.fetch(query: gqlGetEventsByActivityQuery){
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
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

extension SearchResultViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == palsCollectionView {
      return palsByActivity?.count ?? 0
    } else {
      return eventsByActivity?.count ?? 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //check if item is not null before showing the cell
    let palCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PalCollectionViewCell", for: indexPath) as! PalCollectionViewCell
    palCell.configure(with: palsByActivity?[indexPath.item]?.user?.name.fragments.nameFields)
    return palCell
  }
  
  
}
