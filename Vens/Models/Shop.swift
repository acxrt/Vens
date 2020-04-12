//
//  Shop.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit
import RealmSwift

struct Shop: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var lat: Double
    var long: Double
    var type: String
    var adress: String
    var phone: String?
    var web: String?
    
//    @objc dynamic var id: Int
//    @objc dynamic var name: String
//    @objc dynamic var lat: Double
//    @objc dynamic var long: Double
//    @objc dynamic var type: String
//    @objc dynamic var adress: String
//    @objc dynamic var phone: String?
//    @objc dynamic var web: String?
        
//    override static func primaryKey() -> String? {
//        return "id"
//    }
//    
    var isFavourite: Bool? = false
    
    var category: Category {
        if let cat = Category(rawValue: type) { return cat }
        return .altres
    }
    var imageName: String {
        return category.rawValue
    }
    
    var isOpen: Bool? {
        return (id%3 != 0)
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
        return NSLocalizedString("unkownDistance", comment: "")
    }
    
    var annotation: MKPointAnnotation {
        let annot = MKPointAnnotation()
        annot.title = self.name
        annot.subtitle = self.category.localized()
        annot.coordinate = self.locationCoordinate
        return annot
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


