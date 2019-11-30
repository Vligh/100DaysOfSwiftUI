//
//  ContentView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  static let beerHabitAlternatives: [Habit] = [
    Habit(name: "Drinking tea", minStep: "drink 1 cup of tea"),
    Habit(name: "Drinking juice", minStep: "drink 1 glass of juice"),
    Habit(name: "Drinking water", minStep: "drink 1 glass of water")
  ]
  static let gameHabitAlternatives: [Habit] = [
    Habit(name: "Reading a book", minStep: "read a book for 15 minutes"),
    Habit(name: "Practice German", minStep: "make a German exercise"),
    Habit(name: "Reading with a kid", minStep: "read a book with my kid for 10 minutes")
  ]
  let badHabits: [Habit] = [
    Habit(name: "Drinking beer", minStep: "drink 1 bottle", alternativeHabits: beerHabitAlternatives),
    Habit(name: "Play video games", minStep: "play for 30 minutes", alternativeHabits: gameHabitAlternatives)
  ]

  var body: some View {
    NavigationView {
      List(badHabits) { habit in
        NavigationLink(destination: HabitDetailsView(habit: habit)) {
          VStack(alignment: .leading) {
            Text(habit.name)
          }
        }
      }
      .navigationBarTitle("I have an urge ...")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
