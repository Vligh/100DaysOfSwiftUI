//
//  Filter.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 17.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class Filter: ObservableObject {
  enum SortType {
    case none, name, country
  }

  var sortOrder: SortType = .none

  func setSortOrder(_ newSortOrder: SortType) {
    objectWillChange.send()
    self.sortOrder = newSortOrder
  }
}
