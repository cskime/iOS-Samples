//
//  FViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class FViewController: UIViewController {
  override func loadView() {
    super.loadView()
    print("[F]", #function)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("[F]", #function)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("[F]", #function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("[F]", #function)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("[F]", #function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("[F]", #function)
  }
}
