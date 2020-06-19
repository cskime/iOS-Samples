//
//  DViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
  override func loadView() {
    super.loadView()
    print("[D]", #function)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("[D]", #function)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("[D]", #function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("[D]", #function)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("[D]", #function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("[D]", #function)
  }
  
  @IBAction func popTouched(_ sender: Any) {
    print("========== Pop ==========")
    self.navigationController?.popViewController(animated: true)
  }
}
