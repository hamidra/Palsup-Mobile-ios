//
//  SearchViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 8/2/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit
import SwiftDate
class SearchFilter {
    var activity: String?
    var date: DateRange?
}

class DateRange {
    var startDate:Date?
    var endDate:Date?
    init (start:Date, end:Date){
        startDate = start
        endDate = end
    }
    static func getDateRangeFromString(_ date:String?)->DateRange?{
        switch date?.lowercased() {
        case "soon":
            return DateRange(start:Date(), end:Date()+5.hours)
        case "today":
            return DateRange(start:Date(), end:Date().dateAt(.endOfDay))
        case "week":
            return DateRange(start:Date(), end:Date().dateAt(.endOfWeek))
        case "weekend":
            return DateRange(start:Date().dateAt(.startOfWeek)+5.days, end: Date().dateAt(.startOfWeek)+8.days)
        default:
            return nil
        }
    }
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var activitySearchBar: UISearchBar!
    @IBAction func handleSearchClick(sender:UIButton){
        let filter = SearchFilter()
        filter.activity = activitySearchBar.text
        filter.date = DateRange.getDateRangeFromString(sender.title(for: .normal))
        performSegue(withIdentifier: "performSearch", sender: filter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "performSearch" {
            if let vc = segue.destination as? SearchResultViewController, let filter = sender as? SearchFilter {
                vc.searchFilter = filter
            }
            else
            {
                print("not happening")
            }
        }
    }
    
}

