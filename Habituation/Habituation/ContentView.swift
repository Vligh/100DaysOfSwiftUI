//
//  ContentView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class BadHabits: ObservableObject {
  @Published var items = [Habit]() {
    didSet {
      let encoder = JSONEncoder()

      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "BadHabits")
      }
    }
  }

  init() {
    if let items = UserDefaults.standard.data(forKey: "BadHabits") {
      let decoder = JSONDecoder()

      if let decoded = try? decoder.decode([Habit].self, from: items) {
        self.items = decoded
        return
      }
    }

    self.items = []
  }
}

class GoodHabits: ObservableObject {
  @Published var items = [GoodHabit]() {
    didSet {
      let encoder = JSONEncoder()

      if let encoded = try? encoder.encode(items) {
        UserDefaults.standard.set(encoded, forKey: "GoodHabits")
      }
    }
  }

  init() {
    if let items = UserDefaults.standard.data(forKey: "GoodHabits") {
      let decoder = JSONDecoder()

      if let decoded = try? decoder.decode([GoodHabit].self, from: items) {
        self.items = decoded
        return
      }
    }

    self.items = []
  }
}

struct ContentView: View {

  @State private var addBadHabitViewVisible = false
  @ObservedObject var badHabits = BadHabits()
  @ObservedObject var goodHabits = GoodHabits()

  var body: some View {
    NavigationView {
      List {
        ForEach(badHabits.items) { habit in
          NavigationLink(destination: HabitDetailsView(habit: habit, badHabits: self.badHabits, goodHabits: self.goodHabits)) {
            VStack(alignment: .leading) {
              Text(habit.name)
            }
          }
        }
        .onDelete(perform: removeItems)
      }
      .navigationBarTitle("I have an urge of ...")
      .navigationBarItems(trailing: Button(action: {
        self.addBadHabitViewVisible = true
      }) {
        Image(systemName: "plus")
      })
      .sheet(isPresented: $addBadHabitViewVisible) {
        AddBadHabitView(badHabits: self.badHabits)
      }
    }
  }

  func removeItems(at offsets: IndexSet) {
    self.badHabits.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
