//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 16.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
  let resort: Resort

  var body: some View {
    VStack {
      Text("Elevation: \(resort.elevation)m")
      Text("Show: \(resort.snowDepth)cm")
    }
  }
}

struct SkiDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    SkiDetailsView(resort: Resort.example)
  }
}
