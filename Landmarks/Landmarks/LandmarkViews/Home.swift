//
//  Home.swift
//  Landmarks
//
//  Created by Vitali Tatarintev on 01.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
  var categories: [String: [Landmark]] {
    Dictionary(
      grouping: landmarkData,
      by: { $0.category.rawValue }
    )
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(categories.keys.sorted(), id: \.self) { key in
          Text(key)
        }
      }
      .navigationBarTitle(Text("Featured"))
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    CategoryHome()
  }
}
