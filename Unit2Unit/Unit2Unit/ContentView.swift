//
//  ContentView.swift
//  Unit2Unit
//
//  Created by Vitali Tatarintev on 08.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
  
  @State private var sourceValue = "0"
  
  @State private var sourceUnit = 0
  @State private var targetUnit = 1
  
  var currentSourceUnit: String {
    return self.temperatureUnits[self.sourceUnit]
  }
  var currentTargetUnit: String {
    return self.temperatureUnits[self.targetUnit]
  }
  
  var targetValue: Double {
    return Double(self.sourceValue) ?? 0
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Choose what do you want to convert")) {
          TextField("Source", text: $sourceValue)
            .keyboardType(.decimalPad)
          
          Picker("Source unit", selection: $sourceUnit) {
            ForEach(0 ..< temperatureUnits.count) {
              Text(self.temperatureUnits[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section(header: Text("Choose what do you want to see as a result")) {
          Picker("Target unit", selection: $targetUnit) {
            ForEach(0 ..< temperatureUnits.count) {
              Text(self.temperatureUnits[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        
        Section {
          Text("\(self.sourceValue) \(self.currentSourceUnit) is \(self.targetValue, specifier: "%.2f") \(self.currentTargetUnit)")
        }
      }

      .navigationBarTitle("Unit2Unit")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
