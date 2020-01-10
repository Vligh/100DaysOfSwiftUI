//
//  Card.swift
//  Flashzilla
//
//  Created by Vitali Tatarintev on 08.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import Foundation

struct Card: Codable {
  let prompt: String
  let answer: String

  static var example: Card {
    return Card(prompt: "What challenge am I participating in at the moment?", answer: "100 Days of SwiftUI")
  }
}
