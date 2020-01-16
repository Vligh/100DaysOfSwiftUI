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

  let resorts: [Resort] = Bundle.main.decode("resorts.json")

  var body: some View {
    NavigationView {
      List(resorts) { resort in
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

      WelcomeView()
    }
    .environmentObject(favorites)
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
