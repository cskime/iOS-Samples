//
//  ViewController.swift
//  MVPSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {

  private let tableView = UITableView()
  private var products = [Product]()
  
  // MARK: Presenter
  
  // View는 Presenter를 소유하고 있다
  private lazy var presenter = HomeFeedPresenter(view: self, provider: ProductProvider())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = .systemBackground
    self.navigationItem.title = "Home"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(load(_:)))
    self.tableView.dataSource = self
    self.tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
    
    let guide = self.view.safeAreaLayoutGuide
    self.view.addSubview(self.tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.tableView.topAnchor.constraint(equalTo: guide.topAnchor),
      self.tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      self.tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
  
  // MARK: Action
  
  // View가 사용자 입력을 받으면 그 action을 Presenter에게 전달한다. 여기서는 데이터를 요청함
  @objc func load(_ sender: Any) {
    self.presenter.loadProducts()
  }

  // View를 update하는 부분. Presenter가 View의 참조를 갖고 있다가 필요할 때 update 해준다.
  // 즉, Presenter에 의해 View가 update되도록 만듦
  func update(_ products: [Product]) {
    self.products = products
    self.tableView.reloadData()
  }
}

// MARK:- UITableViewDataSource

extension HomeFeedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.products.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath)
    let product = self.products[indexPath.row]
    cell.textLabel?.text = product.title
    cell.detailTextLabel?.text = product.price.description
    return cell
  }
}
