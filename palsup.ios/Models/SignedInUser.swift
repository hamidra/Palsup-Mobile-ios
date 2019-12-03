//
//  SignedInUser.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/26/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation

class SignedInUser {
  private static var _user:User? = nil
  private static var _location:Location? = nil
  
  static var currentPal : CreatePalMutation.Data.CreatePal?
  
  static var Identity: User {
    if _user == nil {
      _user = User()
      _user!.id = "5ddc223c33cbee51992efdb7"
      _user!.name = Name(first: "Hamid", last: "Alipour")
    }
    return _user!
  }
  
  static var location: Location {
    if _location == nil {
      _location = Location(address: nil, city: "Seattle", state: "WA", coordinates: nil)
    }
    return _location!
  }
}
