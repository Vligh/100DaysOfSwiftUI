//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Vitali Tatarintev on 02.11.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
  @Environment(\.editMode) var mode
  @EnvironmentObject var userData: UserData
  @State var draftProfile = Profile.default
  
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      HStack {
        Spacer()
        
        EditButton()
      }

      if self.mode?.wrappedValue == .inactive {
        ProfileSummary(profile: draftProfile)
      } else {
        ProfileEditor(profile: $draftProfile)
      }
    }
    .padding()
  }
}

struct ProfileHost_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHost()
  }
}
