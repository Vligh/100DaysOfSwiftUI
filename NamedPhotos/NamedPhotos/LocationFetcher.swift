//
//  LocationFetcher.swift
//  NamedPhotos
//
//  Created by Vitali Tatarintev on 03.01.20.
//  Copyright © 2020 Vitali Tatarintev. All rights reserved.
//

import CoreLocation

class LocationFetcher: NSObject, CLLocationManagerDelegate {
  let manager = CLLocationManager()
  var lastKnownLocation: CLLocationCoordinate2D?

  override init() {
    super.init()
    manager.delegate = self
  }

  func start() {
    manager.requestWhenInUseAuthorization()
    manager.startUpdatingLocation()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    lastKnownLocation = locations.first?.coordinate
  }
}
