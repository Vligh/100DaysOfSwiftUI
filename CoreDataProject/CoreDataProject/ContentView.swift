//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Vitali Tatarintev on 14.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc

  var body: some View {
    Text("Hello World")
  }

  func saveIfChanged() {
    if self.moc.hasChanges {
      try? self.moc.save()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
