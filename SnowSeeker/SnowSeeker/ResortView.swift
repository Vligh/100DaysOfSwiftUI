//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 16.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ResortView: View {
  let resort: Resort

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 0) {
        Image(decorative: resort.id)
        .resizable()
        .scaledToFit()

        Group {
          Text(resort.description)
            .padding(.vertical)

          Text("Facilities")
            .font(.headline)

          Text(resort.facilities.joined(separator: ", "))
            .padding(.vertical)
        }
        .padding(.horizontal)
      }
    }
    .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
  }
}

struct ResortView_Previews: PreviewProvider {
  static var previews: some View {
    ResortView(resort: Resort.example)
  }
}
