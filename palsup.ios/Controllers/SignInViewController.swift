//
//  SignInViewController.swift
//  palsup.ios
//
//  Created by Hamid Alipour on 12/20/19.
//  Copyright © 2019 Deepnosis. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  var keyBoardIsShown:Bool = false
  
  lazy var signupLabel: UILabel = {
    let label = UILabel()
    label.text = "Not registered with us"
    return label
  }()
  
  lazy var signupButton: UIButton = {
    let titleAttributes: [NSAttributedString.Key: Any] = [
    .foregroundColor: UIColor.blue,
    .underlineStyle: NSUnderlineStyle.single.rawValue]
    let buttonTitle = NSMutableAttributedString(string: "Create a new account", attributes: titleAttributes)
    let button = UIButton()
    button.setAttributedTitle(buttonTitle, for: .normal)
    button.addTarget(self, action: #selector(signupTapAction), for: .touchUpInside)
    return button
  }()
  
  lazy var signupStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [signupLabel, signupButton])
    stackView.axis = .vertical
    stackView.spacing = 10
    return stackView
  }()
  
  lazy var userAuthIdTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "username"
    return textField
  }()
  
  lazy var passwordTextField: UITextField = {
    let textField = UITextField()
    textField.isSecureTextEntry = true
    textField.borderStyle = .roundedRect
    textField.placeholder = "password"
    return textField
  }()
  
  lazy var signInButton: UIButton = {
    let button = UIButton()
    button.setTitle("Sign In", for: .normal)
    button.setTitleColor(UIColor.white, for: .normal)
    button.backgroundColor = UIColor.systemBlue
    button.addTarget(self, action: #selector(signinTapAction), for: .touchUpInside)
    return button
  }()
  
  lazy var signInStack: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [userAuthIdTextField, passwordTextField, signInButton])
    stackView.spacing = 10
    stackView.axis = .vertical
    return stackView
  }()
  
  lazy var containerView: UIView = {
    let view = UIView()
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    self.containerView.addSubview(signupStackView)
    self.containerView.addSubview(signInStack)
    self.view.addSubview(containerView)
    
    // add observers to move the view up if the keyboard is shown
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    setupLayout()
  }
  
  func setupLayout() {
    signInStack.snp.makeConstraints {make in
      make.centerX.equalTo(self.containerView)
      make.centerY.equalTo(self.containerView).offset(50)
      make.left.equalTo(self.containerView).offset(50)
      make.right.equalTo(self.containerView).offset(-50)
    }
    signupStackView.snp.makeConstraints {make in
      make.centerX.equalTo(self.containerView)
      make.bottom.equalTo(signInStack.snp.top).offset(-20)
    }
    containerView.snp.makeConstraints {make in
      make.edges.equalToSuperview()
    }
  }
  
  @objc func signupTapAction() {
    self.performSegue(withIdentifier: "toSignup", sender: nil)
  }
  
  @objc func signinTapAction() {
    if let username = userAuthIdTextField.text, let pass = passwordTextField.text {
      SignedInUser.signIn(username: username, pass: pass).then({ _ in
        /*let initialVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InitialVC")
        self.show(initialVC, sender: nil)*/
        self.performSegue(withIdentifier: "toInitialView", sender: nil)
      }).catch({ error in
        print("signIn failed with \(error)")
      })
    }
  }
}

// extend to manage show/collapse keyboard
extension SignInViewController {
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
      if !self.keyBoardIsShown {
        self.keyBoardIsShown = true
        containerView.snp.updateConstraints { (make) -> Void in
          make.bottom.equalTo(self.view).inset(keyboardSize.height)
        }
      }
    }
  }

  @objc func keyboardWillHide(notification: NSNotification) {
    containerView.snp.updateConstraints { (make) -> Void in
      make.bottom.equalTo(self.view)
    }
    self.keyBoardIsShown = false
  }
  
  @objc func handleMainViewTap(_ gestureRecognizer: UITapGestureRecognizer) {
      closeKeyboard()
  }
  
  func closeKeyboard() {
    self.userAuthIdTextField.resignFirstResponder()
    self.passwordTextField.resignFirstResponder()
  }
}
