//
//  MapView.swift
//  Landmarks
//
//  Created by Vitaly Tatarintsev on 27/10/2019.
//  Copyright © 2019 Vitali Tatarintev. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  let coordinate: CLLocationCoordinate2D

  func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
  }

  func updateUIView(_ view: MKMapView, context: Context) {
    let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)

    view.setRegion(region, animated: true)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: landmarkData[0].locationCoordinate)
  }
}
