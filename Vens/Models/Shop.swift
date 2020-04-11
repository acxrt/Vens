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
    var phone: String?
    var web: String? 
        
    var isFavourite: Bool? = false
    
    var category: Category {
        if let cat = Category(rawValue: type) { return cat }
        return .altres
    }
    var imageName: String {
        return category.rawValue
    }
    
    var isOpen: Bool? {
        return Bool.random()
    }
    
    func openStatusLocalized() -> String {
        
        if isOpen ?? false {
            return NSLocalizedString("open", comment: "")
        } else if isOpen == nil {
            return ""
        }
        return NSLocalizedString("closed", comment: "")
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    func distanceToMe() -> String {
        return "175 m"
    }
    
    enum Category: String {
        case alimentacio = "Alimentacio"
        case quotidia = "Quotidia"
        case ociCultura = "OciCultura"
        case galeria = "Galeria"
        case centreComercial = "CentreComercial"
        case serveis = "Serveis"
        case llar = "Llar"
        case bellesa = "Bellesa"
        case mercat = "Mercat"
        case moda = "Moda"
        case altres = "Altres"
        
        func localized() -> String {
            return NSLocalizedString(self.rawValue, comment: "")
        }
    }
}


