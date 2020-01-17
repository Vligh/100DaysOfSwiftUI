//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 16.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
  // the actual resorts the user has favorited
  private var resorts: Set<String>

  // the key we're using to read/write in UserDefaults
  private let saveKey = "Favorites"

  init() {
    // load our saved data
    if let data = UserDefaults.standard.data(forKey: saveKey) {
      if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
        self.resorts = decoded
        return
      }
    }

    // still here? Use an empty array
    self.resorts = []
  }

  // returns true if our set contains this resort
  func contains(_ resort: Resort) -> Bool {
    resorts.contains(resort.id)
  }

  // adds the resort to our set, updates all views, and saves the change
  func add(_ resort: Resort) {
    objectWillChange.send()
    resorts.insert(resort.id)
    save()
  }

  // removes the resort from our set, updates all views, and saves the change
  func remove(_ resort: Resort) {
    objectWillChange.send()
    resorts.remove(resort.id)
    save()
  }

  func save() {
    // write out our data
    if let data = try? JSONEncoder().encode(resorts) {
      UserDefaults.standard.set(data, forKey: saveKey)
    }
  }
}
