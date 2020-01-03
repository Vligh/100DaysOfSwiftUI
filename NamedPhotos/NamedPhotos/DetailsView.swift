//
//  DetailsView.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 31.12.19.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
  let photo: Photo

  var body: some View {
    VStack {
      Text(self.photo.name)
      photo.image
        .resizable()
        .scaledToFit()

      if self.photo.coordinate != nil {
        Text("Image coordinates: \(String(self.photo.coordinate!.latitude)) \(String(self.photo.coordinate!.longitude))")
      } else {
        Text("No coordinates")
      }
    }
  }
}

struct DetailsView_Previews: PreviewProvider {
  static var previews: some View {
    DetailsView(photo: Photo(name: "The name of the photo", uiImage: UIImage(systemName: "shield")!, latitude: 52.52, longitude: 13.405))
  }
}
