//
//  ContentView.swift
//  WatchLandmarks Extension
//
//  Created by Vitali Tatarintev on 04.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      LandmarkList { WatchLandmarkDetail(landmark: $0 )}
        .environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      LandmarkList { WatchLandmarkDetail(landmark: $0) }
        .environmentObject(UserData())
    }
}
