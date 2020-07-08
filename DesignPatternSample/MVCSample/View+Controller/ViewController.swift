//
//  ViewController.swift
//  MVCSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: Model
  
  var model = UserModel()
  
  // MARK: View
  
  let emailTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    return textField
  }()
  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    return textField
  }()
  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("저장", for: .normal)
    return button
  }()
  let displayLabel: UILabel = {
    let label = UILabel()
    label.text = "User 정보"
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
  }()
  
  // MARK: Action
  
  @objc func save(_ sender: UIButton) {
    guard let email = self.emailTextField.text, let password = self.passwordTextField.text else { return }
    self.model.user = User(email: email, password: password)
  }
  
  @objc func modelChanged(_ sender: Notification) {
    guard let user = sender.object as? User else { return }
    self.displayLabel.text = "email : \(user.email)\npassword : \(user.password)"
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // UI Setting
    
    self.view.backgroundColor = .systemBackground
    self.loginButton.addTarget(self, action: #selector(save(_:)), for: .touchUpInside)
    
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    stackView.alignment = .fill
    stackView.spacing = 12
    
    [self.emailTextField, self.passwordTextField, self.loginButton, self.displayLabel].forEach {
      stackView.addArrangedSubview($0)
    }
    
    self.view.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
      stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
    ])
    
    // Observer for Model
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(modelChanged(_:)),
                                           name: NSNotification.Name(rawValue: "UserChange"),
                                           object: nil)
  }
}
