//
//  Roll.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import Foundation

class Rolls: ObservableObject {
  @Published var all: [Roll]

  init() {
    self.all = [
      Roll(firstDice: 1, secondDice: 2),
      Roll(firstDice: 2, secondDice: 4),
      Roll(firstDice: 6, secondDice: 6)
    ]
  }
}

struct Roll: Identifiable {
  let id = UUID()
  var firstDice: Int
  var secondDice: Int
  let createdAt = Date()
}
