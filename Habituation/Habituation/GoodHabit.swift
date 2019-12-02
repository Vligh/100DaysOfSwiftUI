//
//  GoodHabit.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 02.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct GoodHabit: Identifiable {
  let id = UUID()
  var name: String
  var minSteps = [String]()
}
