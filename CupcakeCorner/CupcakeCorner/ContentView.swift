//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Vitali Tatarintev on 08.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var order = Order()

  var body: some View {
    Text("Hello World")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
