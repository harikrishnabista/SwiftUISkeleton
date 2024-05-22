//
//  DistanceCalculater.swift
//  SearchPlaces
//
//  Created by Hari Bista on 10/10/21.
//

import Foundation
import CoreLocation

class DistanceCalculater {
    public static let userLocation = CLLocation(latitude: 37.412040, longitude: -122.148260)
    
    static func calculate(
        userLocation: CLLocation = DistanceCalculater.userLocation,
        placeLocation: CLLocation
    ) -> CLLocationDistance {
        userLocation.distance(from: placeLocation)
    }
}
