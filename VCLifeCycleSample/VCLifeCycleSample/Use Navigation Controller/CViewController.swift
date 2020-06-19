//
//  CViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
  override func loadView() {
    super.loadView()
    print("[C]", #function)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("[C]", #function)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("[C]", #function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("[C]", #function)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("[C]", #function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("[C]", #function)
  }
  
  @IBAction func pushTouched(_ sender: Any) {
    print("========== Push ==========")
    let vc = UIStoryboard(name: "Main2", bundle: nil)
      .instantiateViewController(withIdentifier: "DViewController")
    self.navigationController?.pushViewController(vc, animated: true)
  }
}
