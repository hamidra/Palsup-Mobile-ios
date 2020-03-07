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
  
  private(set) lazy var client: ApolloClient  = {
    let apolloClient = ApolloClient(url: URL(string:"\(Settings.backendURL)/graphql")!)
    
    //set a timer to clear apollo cache every x seconds
    let timer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true, block: { timer in
      apolloClient.clearCache()
      print("gql cache cleared!")
    })
    return apolloClient
  } ()
  
  public func clearCache(){
    client.clearCache()
    print("gql cache cleared!")
  }
}
