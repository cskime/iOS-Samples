//
//  User.swift
//  DesignPatternSample
//
//  Created by cskim on 2020/06/26.
//  Copyright © 2020 cskim. All rights reserved.
//

import Foundation

struct User {
  let email: String
  let password: String
}

class UserModel {
  var user: User? {
    didSet {
      guard let user = user else { return }
      NotificationCenter.default.post(name: NSNotification.Name("UserChange"), object: user)
    }
  }
}
