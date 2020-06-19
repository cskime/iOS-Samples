//
//  MainViewController.swift
//  VCLifeCycleSample
//
//  Created by cskim on 2020/06/19.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
  let titles = [
    "Use present modally",
    "Use UINavigationController",
    "Use UITabbarController"
  ]
  
  let storyboards = [
    UIStoryboard(name: "Present", bundle: nil),
    UIStoryboard(name: "Navigation", bundle: nil),
    UIStoryboard(name: "Tabbar", bundle: nil),
  ]
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = self.titles[indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let initial = [
      "AViewController",
      "Navigation",
      "Tabbar"
    ]
    let storyboard = self.storyboards[indexPath.row]
    let vc = storyboard.instantiateViewController(withIdentifier: initial[indexPath.row])
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }
}
