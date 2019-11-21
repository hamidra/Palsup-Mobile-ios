//
//  Errors.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/18/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation

class GenericErrors : Error {
  var message:String = ""
  var kind:Kind = .generic
  
  init(_ message:String) {
    self.message = message
  }
  enum Kind {
    case generic
  }
}
