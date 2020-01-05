//
//  Prospect.swift
//  HotProspects
//
//  Created by Vitali Tatarintev on 05.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
  let id = UUID()
  var name = "Anonymous"
  var emailAddress = ""
  var isContacted = false
}

class Prospects: ObservableObject {
  @Published var people: [Prospect]

  init() {
    self.people = []
  }
}
