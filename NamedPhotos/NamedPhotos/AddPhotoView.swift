//
//  AddPhotoView.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 01.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct AddPhotoView: View {
  @Environment(\.presentationMode) var presentationMode

  let photo: Image
  @State private var name = ""
  let onSuccess: (_ name: String) -> Void

  var body: some View {
    NavigationView {
      Form {
        Section {
          photo
            .resizable()
            .scaledToFit()
        }

        Section {
          TextField("Name", text: $name)
        }
      }
      .navigationBarTitle("Name the photo")
      .navigationBarItems(trailing: Button("Done") {
        self.onSuccess(self.name)
        self.presentationMode.wrappedValue.dismiss()
      })
    }
  }
}

struct AddPhotoView_Previews: PreviewProvider {
  static var previews: some View {
    AddPhotoView(photo: Image(systemName: "shield"), onSuccess: { _ in })
  }
}
