//
//  SearchResultViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/14/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import Promises

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
  var palsByActivity:[Pal]? {
    didSet {
      palsCollectionView.reloadData()
    }
  }
  var searchFilter:SearchFilter?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let currentUser = SignedInUser.Identity, let userId = currentUser.id {
      //register the cells
      palsCollectionView.register(PalCollectionViewCell.self, forCellWithReuseIdentifier: "PalCollectionViewCell")
      
      eventsCollectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "EventCollectionViewCell")
      
      if let filter = searchFilter, let activity = filter.activity, let signedInUser = SignedInUser.Identity, let userLocation = signedInUser.location, let longitude = userLocation.coordinates?.longitude, let latitude = userLocation.coordinates?.latitude {
        print("\(filter.activity!) \n from: \(filter.date?.startDate) \n to: \(filter.date?.endDate)")

        
        // reset currentPal
        SignedInUser.currentPal = nil
        
        // create a pal
        
        // ToDO: We assume user only gets to this View if already is signed in, If it is not signed in it should be redirected to signin page
        let dateRangeInput:DateRangeInput? = (filter.date != nil && filter.date?.startDate != nil && filter.date?.endDate != nil) ? DateRangeInput(startDate: filter.date!.startDate!.toISO(), endDate: filter.date!.endDate!.toISO()) : nil
        
        // ToDO: We assume user has given access to its location to the App and the SignedInUser.Identity.location is already synched with device location
        let coordinatesInput = CoordinatesInput(longitude: longitude, latitude: latitude)
        let locationInput = LocationInput(address: userLocation.address, city: userLocation.city, state: userLocation.state, coordinates: coordinatesInput, radius: userLocation.radius)
        let palInput = PalInput(userId: currentUser.id!, activity: activity, location: locationInput, date: dateRangeInput)
        
        let gqlCreatePalMutation = CreatePalMutation(pal: palInput)
        GqlClient.shared.client.perform(mutation: gqlCreatePalMutation) {
          result in
          switch result {
          case .success(let gqlResult):
            SignedInUser.currentPal = gqlResult.data?.createPal
          case .failure(let error):
            print(error)
          }
        }
        
        let gqlActivityFilter = ActivityFilterInput(activity: activity, date: dateRangeInput, location: locationInput)
        
        // Query Pals by Activity
        getPalsByActivity(userId: userId, activityFilter: gqlActivityFilter).then({ pals in
          self.palsByActivity = pals
        })
        
        // Query Events by Activity
        let gqlGetEventsByActivityQuery = GetEventsByActivityQuery(userId: currentUser.id, activityFilter: gqlActivityFilter)
        GqlClient.shared.client.fetch(query: gqlGetEventsByActivityQuery){
          result in
          switch result {
          case .success(let gqlResult):
            self.eventsByActivity = gqlResult.data?.getEventsByActivity
          case .failure(let error):
            print(error)
          }
        }
      } else {
        print("could not search for the user some required search filters are missing! \n filter: \(searchFilter) \n Identity: \(SignedInUser.Identity)")
      }
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showUserDetail" {
      if let vc = segue.destination as? PalInfoViewController, let pal = sender as? Pal {
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
  
  func palCellTapAction(oPal: Pal?){
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

extension SearchResultViewController {
  func getPalsByActivity(userId: String, activityFilter: ActivityFilterInput) -> Promise<[Pal]> {
    let decoder = JSONDecoder()
    return Promise<[Pal]> { fulfill, reject in
      var items: [Pal] = []
      let gqlGetPalsByActivityQuery = GetPalsByActivityQuery(userId: userId, activityFilter: activityFilter)
      GqlClient.shared.client.fetch(query: gqlGetPalsByActivityQuery) { result in
        switch result {
        case .success(let gqlResult):
          if let pals = gqlResult.data?.getPalsByActivity {
            items = pals.compactMap({ item in
              if let palItem = item {
                do {
                  let palData = try JSONSerialization.data(withJSONObject: palItem.jsonObject, options: [])
                  let pal =  try decoder.decode(Pal.self, from: palData )
                  return pal
                } catch {
                  print("Error happened in deserialization of palItem\(palItem), error:\(error)")
                  return nil
                }
              } else {
                return nil
              }
            })
          } else {
            print("getPalsByActivity returned no data")
          }
          return fulfill(items)
        case .failure(let error):
          print(error)
        }
      }
    }
  }
}
