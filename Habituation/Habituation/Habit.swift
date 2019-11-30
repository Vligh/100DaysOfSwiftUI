//
//  Habit.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Habit: Identifiable {
  let id = UUID()
  let isBad = true
  var name: String
  var minStep: String
  var alternativeHabits = [Habit]()
}
