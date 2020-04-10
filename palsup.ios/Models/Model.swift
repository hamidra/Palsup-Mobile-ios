//
//  Event.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 11/8/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation

struct Pal: Codable {
  var id: String? = nil
  var user: User? = nil
  var activity: String? = nil
  var location: Location? = nil
  var date: DateRangeEntity? = nil
  var interested: [String?]? = nil
  var score: Float? = nil
  
  static func decode(_ json: Data) -> Pal? {
    let decoder = JSONDecoder()
    let pal = try? decoder.decode(Pal.self, from: json)
    return pal
  }
}

struct PalsGroupedByUser: Codable {
  var user: User? = nil
  var pals: [Pal?]? = []
}

struct Event: Codable {
  var id: String? = nil
  var description: String? = nil
  var activity: String? = nil
  var location: Location? = nil
  var date: DateRangeEntity? = nil
  var group: Group? = nil
  var image: String? = nil
  var absoluteImage: String? = nil
  
  static func decode(_ json: Data) -> Event? {
    let decoder = JSONDecoder()
    let event = try? decoder.decode(Event.self, from: json)
    return event
  }
}

struct Group: Codable {
  var members: [User?]? = []
  var waitlist:[User?]? = []
  var conversation: [Message]? = []
  
  func getTopMembers(topN:Int) -> [User] {
    return getTopUsers(topN: topN, users: self.members)
  }
  
  func getTopWaitlist(topN:Int) -> [User] {
    return getTopUsers(topN: topN, users: self.waitlist)
  }
  
  private func getTopUsers(topN:Int, users:[User?]?) -> [User] {
    var topUsers:[User] = []
    if let users = users , users.count > 0 {
      for i in 0..<min(topN, users.count) {
        if let user = users[i] {
          topUsers.append(user)
        }
      }
    }
    return topUsers
  }
}

struct Message: Codable {
  var id: String? = nil
  var from: User? = nil
  var type: String? = nil
  var to: String? = nil
  var content: MessageContent? = nil
}

struct MessageContent: Codable {
  var timestamp: String? = nil
  var text: String? = nil
}

struct User: Codable {
  var id: String? = nil
  var gender: String? = nil
  var name: Name? = nil
  var email: String? = nil
  var cell: String? = nil
  var pushNotificationToken: String? = nil
  var location: Location? = nil
  var education: [Education]? = []
  var work: [Work]? = []
  var dob: String? = nil
  var bio: String? = nil
  var registrationDate: String? = nil
  var picture: Picture? = nil
  var absolutePicture: Picture? = nil
}

struct Education: Codable {
  var school: String? = nil
  var classOf: String? = nil
}

struct Work: Codable {
  var title: String? = nil
  var organization: String? = nil
}

struct DateRangeEntity: Codable {
  var startDate: String? = nil
  var endDate: String? = nil
}

struct Location: Codable {
  var address: String? = nil
  var city: String? = nil
  var state: String? = nil
  var coordinates: Coordinates? = nil
  var radius: Int? = nil
}

struct Coordinates: Codable {
  var longitude: Double? = nil
  var latitude: Double? = nil
}

struct Name: Codable {
  var first: String? = nil
  var last: String? = nil
}

struct Picture: Codable {
  var large: String? = nil
  var medium: String? = nil
  var thumbnail: String? = nil
}

struct EventNotifications: Codable {
  var user: User? = nil
  var event: Event? = nil
  var info: NotificationInfo? = nil
}

struct PalNotifications: Codable {
  var user: User? = nil
  var pal: Pal? = nil
  var info: NotificationInfo? = nil
}

struct NotificationInfo: Codable {
  var totalCount: Int? = nil
  var new: Bool? = nil
  var newMessageCount: Int? = nil
  var newMessages: [String]? = []
  var newInterestCount: Int? = nil
  var newInterestedUsers: [String]? = []
  var newMembersCount: Int? = nil
  var newMembers: [String]? = []
  var date: String? = nil
}
