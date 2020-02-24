//
//  LocationManger.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 2/1/20.
//  Copyright © 2020 Deepnosis. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
  static var _current: LocationManager?
  let geoCoder = CLGeocoder()
  let clLocationManager = CLLocationManager()
  
  public static var current: LocationManager {
    if _current == nil {
      _current = LocationManager()
    }
    return _current!
  }
  
  public func start() {
    clLocationManager.requestWhenInUseAuthorization()
    clLocationManager.delegate = self
    clLocationManager.desiredAccuracy = kCLLocationAccuracyKilometer // this should be enough
    clLocationManager.startUpdatingLocation()
  }
}

extension LocationManager: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if  let location = locations.last {
      self.geoCoder.reverseGeocodeLocation(location) { placemarks, _ in
        if let place = placemarks?.first, place.location != nil {
          SignedInUser.setLocation(place: place)
          print(place)
        } else {
          SignedInUser.setLocation(location: location)
        }
      }
    }
  }
}
