//
//  Order.swift
//  CupcakeCorner
//
//  Created by Vitali Tatarintev on 08.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

class Order: ObservableObject {
  static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

  @Published var type = 0
  @Published var quantity = 3

  @Published var specialRequestEnabled = false
  @Published var extraFrosting = false
  @Published var addSprinkles = false
}
