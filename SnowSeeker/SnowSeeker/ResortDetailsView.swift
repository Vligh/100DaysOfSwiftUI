//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 16.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {
  let resort: Resort

  var body: some View {
    Group {
      Text("Size: \(resort.wrappedSize)").layoutPriority(1)
      Spacer().frame(height: 0)
      Text("Price: \(resort.wrappedPrice)").layoutPriority(1)
    }
  }
}

struct ResortDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    ResortDetailsView(resort: Resort.example)
  }
}
