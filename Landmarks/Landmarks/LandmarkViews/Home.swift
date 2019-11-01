//
//  Home.swift
//  Landmarks
//
//  Created by Vitali Tatarintev on 01.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
  var body: some View {
    NavigationView {
      Text("Landmarks Content")
        .navigationBarTitle(Text("Featured"))
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
  }
}
