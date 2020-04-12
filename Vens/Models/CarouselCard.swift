//
//  CarouselCard.swift
//  Vens
//
//  Created by Albert on 11/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import Foundation

struct CarouselCard: Hashable, Codable, Identifiable {
    
    var id: Int
    var imageName: String
    var title: String
    var text: String
        
}
