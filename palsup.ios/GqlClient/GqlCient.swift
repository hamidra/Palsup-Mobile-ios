//
//  Apollo.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/15/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation
import Apollo

class GqlCient {
    static let shared = GqlCient()
    
    private(set) lazy var client = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
}
