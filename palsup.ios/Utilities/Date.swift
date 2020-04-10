//
//  Date.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 10/29/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import Foundation
import SwiftDate

enum DateLiteral:Int {
  case soon = 0
  case today = 1
  case week = 2
  case weekend = 3
}

extension Date {
  public static func dateFromBson(bsonDate:String?) -> Date? {
    if let milliseconds = Int(bsonDate ?? "NIL") {
      return Date(milliseconds: milliseconds)
    } else {
      return nil
    }
  }
}

class DateRange {
  var startDate:Date?
  var endDate:Date?
  
  init (start:Date?, end:Date?){
    startDate = start
    endDate = end
  }
  
  init (start s:String?, end e:String?){
    if let start = s {
      startDate = Date(start)
    }
    if let end = e {
      endDate = Date(end)
    }
  }
  
  init (start s:Int?, end e:Int?){
    if let start = s {
      startDate = Date(milliseconds:start)
    }
    if let end = e {
      endDate = Date(milliseconds:end)
    }
  }
  
  static func getDateRangeFromLiteral(_ date:DateLiteral?)->DateRange?{
    switch date {
    case .soon:
      return DateRange(start:Date(), end:Date()+5.hours)
    case .today:
      return DateRange(start:Date(), end:Date().dateAt(.endOfDay))
    case .week:
      return DateRange(start:Date(), end:Date().dateAt(.endOfWeek))
    case .weekend:
      return DateRange(start:Date().dateAt(.startOfWeek)+5.days, end: Date().dateAt(.startOfWeek)+8.days)
    default:
      return nil
    }
  }
  
  func displayDateFromNow()->String? {
    print(self.startDate)
    print(self.endDate)
    if let start = self.startDate, start > Date() {
      print(start.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english))
      return start.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english)
    } else if let end = self.endDate, end > Date() {
      print("anytime in the next \(end.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english))")
      return "anytime in the next \(end.toRelative(style: RelativeFormatter.defaultStyle(), locale: Locales.english))"
    } else if self.startDate != nil || self.endDate != nil {
      print("past")
      return "past"
    } else {
      return nil
    }
  }
}
