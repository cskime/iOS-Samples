//
//  AddressBookViewController.swift
//  MVVMSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class Button: UIButton {
  var listener: ()->Void = { }
  
  func bind(_ listener: @escaping ()->Void) {
    self.listener = listener
    self.addTarget(self, action: #selector(touched(_:)), for: .touchUpInside)
  }
  
  @objc private func touched(_ sender: UIButton) {
    self.listener()
  }
}

class AddressBookViewController: UIViewController {
  
  private let tableView = UITableView()
  private let button = Button(type: .system)
  
  private var viewModel = AddressViewModel()
  private var addresses = [Address]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .systemBackground
    self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AddressCell")
    self.tableView.dataSource = self
    self.navigationItem.title = "AddressBook"
    
    self.button.setImage(UIImage(systemName: "plus"), for: .normal)
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.button)
    
    let guide = self.view.safeAreaLayoutGuide
    self.view.addSubview(self.tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
   
    self.bind()
  }
  
  private func bind() {
    // State Binding
    // View는 ViewModel의 상태가 변경되었을 때 view를 update하기 위한 로직을 binding 해 둔다
    self.viewModel.bind { [weak self] (addresses) in
      self?.addresses = addresses
      self?.tableView.reloadData()
    }
    
    // Action Binding
    self.button.bind {
      self.viewModel.action(.add)
    }
  }
}

// MARK:- UITableViewDataSource

extension AddressBookViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.addresses.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath)
    cell.textLabel?.text = self.addresses[indexPath.row].address
    return cell
  }
}
