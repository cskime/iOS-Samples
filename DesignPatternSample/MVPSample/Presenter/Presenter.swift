//
//  Presenter.swift
//  MVPSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import Foundation

class HomeFeedPresenter {
  
  weak var homeFeedView: HomeFeedViewController?
  
  // 데이터를 제공하는 Provider 객체를 통해 데이터를 가져오고 가공하는 등 작업을 할 수 있다
  private var provider: ProductProvider
  
  init(provider: ProductProvider) {
    self.provider = provider
  }
  
  init(view: HomeFeedViewController, provider: ProductProvider) {
    self.homeFeedView = view
    self.provider = provider
  }
  
  func attach(_ view: HomeFeedViewController) {
    self.homeFeedView = view
  }
  
  // View가 요청할 수 있는 method를 제공하고 있음
  // 이 method를 통해 데이터를 요청 및 가공하여 view에게 필요한 data를 전달하면서 View를 update한다
  func loadProducts() {
    let products = self.provider.products
    self.homeFeedView?.update(products)
  }
}
