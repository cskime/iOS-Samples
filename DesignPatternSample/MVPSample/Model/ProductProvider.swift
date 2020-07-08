//
//  ProductProvider.swift
//  MVPSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import Foundation

class ProductProvider {
  var products: [Product] {
    return [
      Product(title: "아이패드", price: 1_000_000),
      Product(title: "아이폰", price: 1_000_000),
      Product(title: "맥북프로", price: 3_000_000),
      Product(title: "맥프로", price: 8_000_000),
      Product(title: "아이맥 프로", price: 6_000_000)
    ]
  }
}
