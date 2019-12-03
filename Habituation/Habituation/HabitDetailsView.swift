//
//  HabitDetailsView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 30.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct HabitDetailsView: View {
  let habit: Habit

  @State private var addAlternativeHabitViewVisible = false

  var body: some View {
    VStack {
      Text("Having urge of \(self.habit.name)?")
        .font(.title)
        .padding(.bottom)

      Form {
        Section(header: Text("Instead of \(self.habit.minStep) try")) {
          ForEach(self.habit.alternativeHabits) { alternativeHabit in
            ForEach(alternativeHabit.minSteps, id: \.self) { minStep in
              Button(minStep) {

              }
            }
          }
        }

        Section(header: Text("or")) {
          Button("Suggest an alternative action") {
            self.addAlternativeHabitViewVisible = true
          }
        }

        Section {
          Button("Nah! I'll \(self.habit.minStep) anyway") {

          }
          .foregroundColor(.red)
        }
      }
    }
    .sheet(isPresented: $addAlternativeHabitViewVisible) {
      GoodHabitsView()
    }
  }
}

struct HabitDetailsView_Previews: PreviewProvider {
  static let alternativeHabits: [GoodHabit] = [
    GoodHabit(
      name: "Drinking alcohol free drinks",
      minSteps: ["drink a cup of tea", "drink a glass of juice", "drink a glass of water"]
    )
  ]
  static let habit = Habit(name: "Drinking Beer", minStep: "drink 1 bottle of beer", alternativeHabits: alternativeHabits)

  static var previews: some View {
    HabitDetailsView(habit: habit)
  }
}
