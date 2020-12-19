//
//  MapModel.swift
//  Savanna
//
//  Created by Sergey on 16.12.2020.
//

import Foundation
import MapKit

struct MapModel: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
