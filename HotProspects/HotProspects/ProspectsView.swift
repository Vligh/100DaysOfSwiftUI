//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Vitali Tatarintev on 05.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ProspectsView: View {
  enum FilterType {
    case none, contacted, uncontacted
  }

  let filter: FilterType

  var title: String {
    switch filter {
    case .none:
      return "Everyone"
    case .contacted:
      return "Contacted people"
    case .uncontacted:
      return "Uncontacted people"
    }
  }
  
  var body: some View {
    NavigationView {
      Text("Hello Prospects!")
        .navigationBarTitle(title)
    }
  }
}

struct ProspectsView_Previews: PreviewProvider {
  static var previews: some View {
    ProspectsView(filter: .none)
  }
}
