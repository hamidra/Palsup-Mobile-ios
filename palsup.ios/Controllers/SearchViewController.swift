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
  
  var keyBoardIsShown:Bool = false
  
  
  lazy var headerImage: UIImageView = {
    let image  = UIImage(named: "communityBanner")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  lazy var activitySearchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "Search for your favorite activities..."
    searchBar.returnKeyType = .done
    searchBar.delegate = self
    return searchBar
  }()
  
  lazy var soonButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("Soon", for: .normal)
    button.tag = 0
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()
  
  lazy var todayButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("Today", for: .normal)
    button.tag = 1
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()
  
  lazy var weekButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("This Week", for: .normal)
    button.tag = 2
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()
  
  lazy var weekendButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("This Weekend", for: .normal)
    button.tag = 3
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()
  
  lazy var anytimeButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("Anytime", for: .normal)
    button.tag = 4
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()
  
  lazy var sometimeButton: SearchButton = {
    let button = SearchButton()
    button.setTitle("Sometime", for: .normal)
    button.tag = 5
    button.addTarget(self, action: #selector(handleSearchClick), for: .touchUpInside)
    return button
  }()

  lazy var buttonStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [soonButton, todayButton, weekButton, weekendButton, anytimeButton, sometimeButton])
    stackView.axis = .vertical
    stackView.spacing = 20
    stackView.alignment = .fill
    stackView.contentMode = .scaleToFill
    return stackView
  }()
  
  lazy var searchView: UIView = {
    let view = UIView()
    view.addSubview(headerImage)
    view.addSubview(activitySearchBar)
    view.addSubview(buttonStack)
    return view
  }()
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.addSubview(searchView)
    return scrollView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupView()
  }
  
  func setupView() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(showSettings))
    self.view.addSubview(scrollView)
    setupLayout()
    
    // add tap genture recognizer
    let tapGenstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleMainViewTap))
    self.view.addGestureRecognizer(tapGenstureRecognizer)
    
    // add observers to move the view up if the keyboard is shown
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  func setupLayout() {
    headerImage.translatesAutoresizingMaskIntoConstraints = false
    headerImage.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(searchView)
      make.right.equalTo(searchView)
      make.left.equalTo(searchView)
      make.bottom.equalTo(activitySearchBar.snp.top)
    }
    
    activitySearchBar.translatesAutoresizingMaskIntoConstraints = false
    activitySearchBar.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(searchView)
      make.right.equalTo(searchView)
      make.bottom.equalTo(buttonStack.snp.top)
    }
    
    buttonStack.translatesAutoresizingMaskIntoConstraints = false
    buttonStack.snp.makeConstraints { (make) -> Void in
      make.left.equalTo(searchView).offset(20)
      make.right.equalTo(searchView).offset(-20)
      make.bottom.equalTo(searchView).offset(-20)
    }
    
    searchView.translatesAutoresizingMaskIntoConstraints = false
    searchView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(scrollView)
      make.width.equalTo(self.view)
    }
    
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.snp.makeConstraints { (make) -> Void in
      make.edges.equalTo(self.view)
    }
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
  
  
  @objc func showSettings() {
    self.show(EditProfileViewController(), sender: nil)
  }
  
  @objc func handleSearchClick(sender:UIButton) {
      let filter = SearchFilter()
      filter.activity = activitySearchBar.text
    filter.date = DateRange.getDateRangeFromLiteral(DateLiteral(rawValue: sender.tag))
      performSegue(withIdentifier: "performSearch", sender: filter)
  }

}

// extend to manage show/collapse keyboard
extension SearchViewController {
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      
      if !self.keyBoardIsShown {
        self.keyBoardIsShown = true
        scrollView.snp.updateConstraints { (make) -> Void in
          make.bottom.equalTo(self.view).inset(keyboardSize.height)
        }
      }
    }
  }

  @objc func keyboardWillHide(notification: NSNotification) {
    scrollView.snp.updateConstraints { (make) -> Void in
      make.bottom.equalTo(self.view)
    }
    self.keyBoardIsShown = false
  }
  
  @objc func handleMainViewTap(_ gestureRecognizer: UITapGestureRecognizer) {
      closeKeyboard()
  }
  
  func closeKeyboard() {
    self.activitySearchBar.resignFirstResponder()
  }
}

extension SearchViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      closeKeyboard()
  }
}

