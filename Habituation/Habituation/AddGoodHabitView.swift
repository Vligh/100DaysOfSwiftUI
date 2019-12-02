//
//  AddGoodHabitView.swift
//  Habituation
//
//  Created by Vitali Tatarintev on 02.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AddGoodHabitView: View {
  @Environment(\.presentationMode) var presentationMode

  @State private var name = ""
  @State private var minStep = ""
  @State private var minSteps = [String]()

  var isValid: Bool {
    self.name != "" && self.minSteps.count > 0
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("What positive activity do you want to work on?")) {
          TextField("Name an activity", text: $name)
        }

        Section(header: Text("What are the minimal steps to make progress in this activity?")) {
          ForEach(self.minSteps, id: \.self) { step in
            Text(step)
          }

          TextField("Describe a minimal step", text: $minStep)

          Button("Add step") {
            self.minSteps.append(self.minStep)
            self.minStep = ""
          }
          .disabled(self.minStep == "")
        }
      }
      .navigationBarTitle("Add good habit")
      .navigationBarItems(trailing: Button("Save") {
        self.presentationMode.wrappedValue.dismiss()
      }
      .disabled(!isValid)
      )
    }
  }
}

struct AddGoodHabitView_Previews: PreviewProvider {
  static var previews: some View {
    AddGoodHabitView()
  }
}
