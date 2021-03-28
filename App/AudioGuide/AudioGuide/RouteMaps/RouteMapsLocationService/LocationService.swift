//
//  LocationService.swift
//  AudioGuide
//
//  Created by Артем Стратиенко on 28.03.2021.
//

import Foundation
import CoreLocation

extension RouteMapsViewController  {
    // MARK 1
    func initLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    // MARK 2
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            print("Warning: No last location found")
            return
        }
        tempPosition = lastLocation.coordinate
        print(tempPosition)
        
    }
    // MARK 3
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    // MARK 4
    func startLocation() {
        locationManager.startUpdatingLocation()
    }
    // MARK 5
    func stopLocation() {
        locationManager.stopUpdatingLocation()
    }
}

