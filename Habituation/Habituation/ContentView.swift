//
//  ContentView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

class BadHabits: ObservableObject {
  @Published var items = [Habit]()
}

struct ContentView: View {
  static let beerHabitAlternatives: [GoodHabit] = [
    GoodHabit(
      name: "Drinking alcohol free drinks",
      minSteps: ["drink a cup of tea", "drink a glass of juice", "drink a glass of water"]
    )
  ]
  static let gameHabitAlternatives: [GoodHabit] = [
    GoodHabit(name: "Reading a book", minSteps: ["read a book for 15 minutes"]),
    GoodHabit(name: "Practice German", minSteps: ["make a German exercise"]),
    GoodHabit(name: "Reading with a kid", minSteps: ["read a book with my kid for 10 minutes"])
  ]
  var badHabitList: [Habit] = [
    Habit(name: "Drinking beer", minStep: "drink 1 bottle", alternativeHabits: beerHabitAlternatives),
    Habit(name: "Play video games", minStep: "play for 30 minutes", alternativeHabits: gameHabitAlternatives)
  ]

  @State private var addBadHabitViewVisible = false
  @ObservedObject var badHabits = BadHabits()

  var body: some View {
    NavigationView {
      List(badHabits.items) { habit in
        NavigationLink(destination: HabitDetailsView(habit: habit)) {
          VStack(alignment: .leading) {
            Text(habit.name)
          }
        }
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
    .onAppear(perform: {
      self.badHabits.items = self.badHabitList
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
