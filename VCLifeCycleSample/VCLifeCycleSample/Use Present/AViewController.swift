//
//  ViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
  override func loadView() {
    super.loadView()
    print("[A]", #function)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("[A]", #function)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("[A]", #function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("[A]", #function)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    print("[A]", #function)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("[A]", #function)
  }
  
  @IBAction func presentTouched(_ sender: Any) {
    print("========== Present ==========")
    guard let vc = storyboard?.instantiateViewController(withIdentifier: "BViewController") else { return }
//    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }
}
