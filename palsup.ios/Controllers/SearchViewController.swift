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

