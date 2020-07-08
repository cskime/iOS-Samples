//
//  AppDelegate.swift
//  MVPSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = UINavigationController(rootViewController: HomeFeedViewController()) 
    self.window?.makeKeyAndVisible()
    return true
  }
  
}

