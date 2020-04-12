//
//  Colors.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    
    public static let vensLightPurple = Color(red: 227/255, green: 229/255, blue: 252/255)
    public static let vensMediumPurple = Color(red: 167/255, green: 173/255, blue: 255/255)
    public static let vensDarkPurple = Color(red: 3/255, green: 11/255, blue: 55/255)
    public static let vensYellow = Color(red: 253/255, green: 197/255, blue: 16/255)
    public static let vensTextColor = Color(red: 3/255, green: 11/255, blue: 55/255, opacity: 0.42)
    
    public static let vensScreenBackgroundColor = Color(red: 251, green: 251, blue: 255)
    
    func asUIColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}


