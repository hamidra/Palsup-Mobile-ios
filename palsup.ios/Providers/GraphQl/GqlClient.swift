//
//  Apollo.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/15/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation
import Apollo
import Promises

class GqlClient {
  static let shared = GqlClient()
  
  private(set) lazy var client = ApolloClient(url: URL(string:"\(Settings.backendURL)/graphql")!)
  
}
