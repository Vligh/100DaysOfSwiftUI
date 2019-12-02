//
//  AddBadHabitView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 01.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AddBadHabitView: View {
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var badHabits: BadHabits

  @State private var name = ""
  @State private var minStep = ""

  var isValid: Bool {
    self.name != "" && self.minStep != ""
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("What bad habit are you trying to break?")) {
          VStack(alignment: .leading) {
            TextField("Name", text: $name)

            Text("Try to provide a name for a habit with action, so we will be able to use it in a sentence. Some examples are \"Drinking beer\" or \"Playing computer games\".")
              .font(.footnote)
              .foregroundColor(.gray)
          }

          VStack(alignment: .leading) {
            TextField("Minimal step", text: $minStep)

            Text("What is a minimal step or action of that habit? For example, \"drink 1 bottle of beer\", or \"play games for 30 minutes\".")
              .font(.footnote)
              .foregroundColor(.gray)
          }
        }

        Section(header: Text("Usage examples")) {
          Text("I have an urge of \(self.name == "" ? "<...>" : self.name).")
          Text("I am trying to do less of \(self.name == "" ? "<...>" : self.name)")
          Text("Instead of \(self.minStep == "" ? "<...>" : self.minStep) I can do something else")
        }
      }
      .navigationBarTitle("Add habit")
      .navigationBarItems(trailing: Button("Save") {
        let habit = Habit(name: self.name, minStep: self.minStep)
        self.badHabits.items.append(habit)

        self.presentationMode.wrappedValue.dismiss()
      }
      .disabled(!isValid))
    }
  }
}

struct AddBadHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddBadHabitView(badHabits: BadHabits())
  }
}
