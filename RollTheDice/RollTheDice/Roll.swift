//
//  Roll.swift
//  RollTheDice
//
//  Created by Vitali Tatarintev on 13.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import Foundation

class Rolls: ObservableObject {
  @Published private(set) var all: [Roll]

  init() {
    self.all = []
  }

  func add(_ roll: Roll) {
    all.append(roll)
  }
}

struct Roll: Identifiable {
  let id = UUID()
  var firstDice: Int
  var secondDice: Int
  let createdAt = Date()
}
