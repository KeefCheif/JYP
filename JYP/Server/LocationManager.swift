//
//  LocationManager.swift
//  JYP
//
//  Created by peter allgeier on 6/28/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let manager = CLLocationManager()
    
    @Published var isLoading: Bool = false
    
    @Published var user_location: CLLocationCoordinate2D?
    @Published var city: Locations?
    
    @Published var location_error: LocationError?
    
    override init() {
        super.init()
        self.manager.delegate = self
    }
    
    public func requestLocation() {
        self.manager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error:: \(error.localizedDescription)")
        self.location_error = .failedCurrentLocation
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let coordinate = locations.first?.coordinate else {
            self.location_error = .failedCurrentLocation
            return
        }
        
        self.user_location = coordinate
        self.city = .current(Double(coordinate.latitude), Double(coordinate.longitude))
        self.manager.stopUpdatingLocation()
    }
}
