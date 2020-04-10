//
//  Shop.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Shop: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var lat: Double
    var long: Double
    var type: String
    var adress: String
        
    var isFavourite: Bool? = false
    
    var isOpen: Bool {
        return true
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
}


