//
//  AddressViewModel.swift
//  MVVMSample
//
//  Created by cskim on 2020/06/27.
//  Copyright © 2020 cskim. All rights reserved.
//

import Foundation

struct AddressViewModel {
  // View가 데이터 변화에 따른 view update를 binding
  typealias Listener = ([Address]) -> Void
  var listener: Listener?
    
  // Model의 변경에 따라 ViewModel의 State가 변하게 됨
  // Model의 변화를 ViewModel에 notify -> Property Observer를 사용한 경우
  var addresses = [Address]() {
    didSet {
      // Model이 바뀔 때 ViewModel을 통해 View에 Update
      self.listener?(self.addresses)
    }
  }
  
  // Model이 바뀌면서 ViewModel의 상태가 변함에 따라 View를 Update하기 위한 Listener
  // View에서 model이 바뀌었을 때 view를 update하는 로직을 클로저로 전달할것이다
  mutating func bind(_ listener: Listener?) {
    self.listener = listener
  }
  
  // View에서 Action이 발생했을 때
  enum Action {
    case add
  }
  
  mutating func action(_ action: Action) {
    switch action {
    case .add:
      self.addresses.append(Address(name: "My Address", address: "서울 관악구 행운길 8"))
    }
    self.listener?(self.addresses)
  }
}
