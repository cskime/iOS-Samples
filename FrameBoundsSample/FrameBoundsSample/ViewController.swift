//
//  ViewController.swift
//  FrameBoundsSample
//
//  Created by cskim on 2020/08/07.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

extension CGPoint {
  var text: String { "(\(x), \(y))" }
}

class ViewController: UIViewController {
  
  @IBOutlet weak var blueView: UIView!
  @IBOutlet weak var blueFrame: UILabel!
  @IBOutlet weak var blueBounds: UILabel!
  
  @IBOutlet weak var redView: UIView!
  @IBOutlet weak var redFrame: UILabel!
  @IBOutlet weak var redBounds: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    blueFrame.text = blueView.frame.origin.text
    blueBounds.text = blueView.bounds.origin.text
    
    redFrame.text = redView.frame.origin.text
    redBounds.text = redView.bounds.origin.text
  }
  
  @IBAction func moveBlueFrame(_ sender: Any) {
    let frame = blueView.frame.origin
    blueView.frame.origin = CGPoint(x: frame.x + 50,
                                    y: frame.y + 50)
    blueFrame.text = blueView.frame.origin.text
  }
  
  @IBAction func moveBlueBounds(_ sender: Any) {
    let bounds = blueView.bounds.origin
    blueView.bounds.origin = CGPoint(x: bounds.x + 50,
                                     y: bounds.y + 50)
    blueBounds.text = blueView.bounds.origin.text
  }
  
  @IBAction func moveRedFrame(_ sender: Any) {
    let frame = redView.frame.origin
    redView.frame.origin = CGPoint(x: frame.x + 50,
                                    y: frame.y + 50)
    redFrame.text = redView.frame.origin.text
  }
  
  @IBAction func moveRedBounds(_ sender: Any) {
    let bounds = redView.bounds.origin
    redView.bounds.origin = CGPoint(x: bounds.x + 50,
                                     y: bounds.y + 50)
    redBounds.text = redView.bounds.origin.text
  }
  
  @IBAction func reset(_ sender: Any) {
    let frame = CGPoint(x: 30, y: 100)
    let bounds = CGPoint.zero
    
    blueView.frame.origin = frame
    blueView.bounds.origin = bounds
    blueFrame.text = frame.text
    blueBounds.text = bounds.text
    
    redView.frame.origin = frame
    redView.bounds.origin = bounds
    redFrame.text = frame.text
    redBounds.text = bounds.text
  }
  
}







