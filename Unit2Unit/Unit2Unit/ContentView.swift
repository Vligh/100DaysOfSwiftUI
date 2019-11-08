//
//  ContentView.swift
//  Unit2Unit
//
//  Created by Vitali Tatarintev on 08.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  let celsius = "Celsius"
  let fahrenheit = "Fahrenheit"
  let kelvin = "Kelvin"
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
    let source = Double(self.sourceValue) ?? 0
    
    var result = source
    
    if currentSourceUnit == celsius {
      if currentTargetUnit == fahrenheit {
        // Celsius to Fahrenheit
        result = (source * 9 / 5) + 32
      } else if currentTargetUnit == kelvin {
        // Celsius to Kelvin
        result = source + 273.15
      }
    } else if currentSourceUnit == fahrenheit {
      if currentTargetUnit == celsius {
        // Fahrenheit to Celsius
        result = convertFahrenheitToCelsuis(source)
      } else if currentTargetUnit == kelvin {
        // Fahrenheit to Kelvin
        result = convertFahrenheitToCelsuis(source) + 273.15
      }
    } else {
      if currentTargetUnit == celsius {
        // Kelvin to Celsius
        result = convertKelvinToCelsius(source)
      } else if currentTargetUnit == fahrenheit {
        // Kelvin to Fahrenheit
        result = convertFahrenheitToCelsuis( convertFahrenheitToCelsuis(source))
      }
    }
    
    return result
  }
  
  func convertFahrenheitToCelsuis(_ source: Double) -> Double {
    return (source - 32) * 5 / 9
  }
  
  func convertKelvinToCelsius(_ source: Double) -> Double {
    return source - 273.15
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
