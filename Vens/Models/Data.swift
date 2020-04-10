//
//  Data.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import Foundation

let shopData: [Shop] = load("Shops_BCN.json")
let carouselData: [CarouselCard] = [CarouselCard(id: 1, imageName: "first", title: "Test title", text: "Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal Hola que tal "),
CarouselCard(id: 2, imageName: "second", title: "Test title 2", text: "Adeu! ")]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
