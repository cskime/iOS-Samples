//
//  BViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
  override func loadView() {
    super.loadView()
    print("[B]", #function)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("[B]", #function)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("[B]", #function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("[B]", #function)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("[B]", #function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("[B]", #function)
  }
  
  @IBAction func dismissTouched(_ sender: Any) {
    print("========== Dismiss ==========")
    self.dismiss(animated: true)
  }
}
