//
//  Habit.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

class Habit: Identifiable, Codable {
  let id = UUID()
  var name: String
  var minStep: String
  var alternativeHabits: [GoodHabit]
  var avoidedTimes = 0
  var fellBackTimes = 0

  init(name: String, minStep: String, alternativeHabits: [GoodHabit]) {
    self.name = name
    self.minStep = minStep
    self.alternativeHabits = alternativeHabits
  }

  init(name: String, minStep: String) {
    self.name = name
    self.minStep = minStep
    self.alternativeHabits = [GoodHabit]()
  }

  func avoid() {
    self.avoidedTimes += 1
  }

  func fallback() {
    self.fellBackTimes += 1
  }
}
