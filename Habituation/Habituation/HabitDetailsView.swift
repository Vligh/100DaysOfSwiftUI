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

  var body: some View {
    GeometryReader { geometry in
      VStack {
        Text("But instead of \(self.habit.minStep) I will")
          .padding(.bottom)

        VStack {
          ForEach(self.habit.alternativeHabits) { alternativeHabit in
            Button(alternativeHabit.minStep) {

            }
            .padding()
            .frame(width: geometry.size.width * 0.9)
            .foregroundColor(.green)
            .overlay(
              RoundedRectangle(cornerRadius: 5)
                .stroke(Color.green, lineWidth: 1)
            )
          }
          .padding(.bottom)
        }

        Button("Nah! I'll \(self.habit.minStep) anyway") {

        }
        .padding()
        .frame(width: geometry.size.width * 0.9)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))

        Spacer()
      }
    }
  }
}

struct HabitDetailsView_Previews: PreviewProvider {
  static let alternativeHabits: [Habit] = [
    Habit(name: "Drinking tea", minStep: "drink 1 cup of tea"),
    Habit(name: "Drinking juice", minStep: "drink 1 glass of juice"),
    Habit(name: "Drinking water", minStep: "drink 1 glass of water")
  ]
  static let habit = Habit(name: "Drinking Beer", minStep: "drink 1 bottle of beer", alternativeHabits: alternativeHabits)

  static var previews: some View {
    HabitDetailsView(habit: habit)
  }
}
