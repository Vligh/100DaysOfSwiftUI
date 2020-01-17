//
//  FilterView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 17.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct FilterView: View {
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var filter: Filter

  @State private var sortOrder = 0
  let sortTypes = ["None", "Name", "Country"]

  private var filterSortOrder: Filter.SortType {
    switch self.sortOrder {
    case 1:
      return .name
    case 2:
      return .country
    default:
      return .none
    }
  }

  private var selectedSortOrder: Int {
    switch self.filter.sortOrder {
    case .name:
      return 1
    case .country:
      return 2
    default:
      return 0
    }
  }

  var body: some View {
    NavigationView {
      Form {
        Section(header: HStack {
          Image(systemName: "arrow.up.arrow.down")
          Text("Sort by")
        }) {
          Picker("Sort order", selection: $sortOrder) {
            ForEach(0 ..< sortTypes.count) {
              Text(self.sortTypes[$0])
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
      }
      .navigationBarItems(trailing: Button("Done") {
        self.filter.setSortOrder(self.filterSortOrder)
        self.presentationMode.wrappedValue.dismiss()
      })
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .onAppear(perform: {
      self.sortOrder = self.selectedSortOrder
    })
  }
}

struct FilterView_Previews: PreviewProvider {
  static var previews: some View {
    FilterView()
  }
}
