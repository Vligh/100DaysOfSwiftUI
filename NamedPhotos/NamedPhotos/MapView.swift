//
//  MapView.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 03.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
  var centerCoodinate: CLLocationCoordinate2D

  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
      self.parent = parent
    }
  }

  func makeCoordinator() -> MapView.Coordinator {
    Coordinator(self)
  }

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView()
    mapView.delegate = context.coordinator

    let annotation = MKPointAnnotation()
    annotation.coordinate = self.centerCoodinate
    mapView.addAnnotation(annotation)
    mapView.setCenter(self.centerCoodinate, animated: false)

    let identifier = "Annotation"
    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      annotationView!.canShowCallout = true
    } else {
      annotationView!.annotation = annotation
    }

    return mapView
  }

  func updateUIView(_ uiView: MKMapView, context: Context) {

  }
}

extension MKPointAnnotation {
  static var example: MKPointAnnotation {
    let annotation = MKPointAnnotation()
    annotation.title = "London"
    annotation.subtitle = "Home to the 2012 Summer Olympics"
    annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
    return annotation
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(centerCoodinate: MKPointAnnotation.example.coordinate)
  }
}
