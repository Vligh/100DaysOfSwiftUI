//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Vitali Tatarintev on 15.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var favorites = Favorites()
  @ObservedObject var filter = Filter()

  let resorts: [Resort] = Bundle.main.decode("resorts.json")

  @State private var showingFilter = false

  var filteredResorts: [Resort] {
    var result = resorts

    if filter.country != "None" {
      result = result.filter({ $0.country == filter.country })
    }

    if filter.size != "None" {
      result = result.filter({ $0.wrappedSize == filter.size })
    }

    if filter.price != "None" {
      result = result.filter({ $0.wrappedPrice == filter.price })
    }

    return result
  }

  var sortedResorts: [Resort] {
    switch filter.sortOrder {
    case .none:
      return filteredResorts
    case .name:
      return filteredResorts.sorted(by: { $0.name < $1.name })
    case .country:
      return filteredResorts.sorted(by: { $0.country < $1.country })
    }
  }

  var body: some View {
    NavigationView {
      List(sortedResorts) { resort in
        NavigationLink(destination: ResortView(resort: resort)) {
          Image(resort.country)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 25)
            .clipShape(
              RoundedRectangle(cornerRadius: 5)
            )
            .overlay(
              RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
            )

          VStack(alignment: .leading) {
            Text(resort.name)
              .font(.headline)
            Text("\(resort.runs) runs")
              .foregroundColor(.secondary)
          }

          if self.favorites.contains(resort) {
            Spacer()
            Image(systemName: "heart.fill")
              .accessibility(label: Text("This is a favorite resort"))
              .foregroundColor(Color.red)
          }
        }
      }
      .navigationBarTitle("Resorts")
      .navigationBarItems(trailing: Button(action: {
        self.showingFilter = true
      }) {
        Image(systemName: "slider.horizontal.below.rectangle")
      })

      WelcomeView()
    }
    .environmentObject(favorites)
    .sheet(isPresented: $showingFilter) {
      FilterView()
        .environmentObject(self.filter)
    }
    // .phoneOnlyStackNavigationView()
  }
}

// https://www.hackingwithswift.com/books/ios-swiftui/making-navigationview-work-in-landscape
extension View {
  func phoneOnlyStackNavigationView() -> some View {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
    } else {
      return AnyView(self)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
