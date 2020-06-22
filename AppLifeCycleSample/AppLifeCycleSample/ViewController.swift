//
//  ViewController.swift
//  AppLifeCycleSample
//
//  Created by cskim on 2020/06/22.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func switchToAddress(_ sender: UIButton) {
    UIApplication.shared.openURL(URL(string: "sms:000-0000-0000")!)
  }

}

