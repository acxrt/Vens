//
//  TextModifiers.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import Foundation
import SwiftUI

struct TitleLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.custom("VAGRoundedStd-Bold", size: 24))
    }
}

struct SubtitleLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.custom("OpenSans-Regular", size: 16))
    }
}

struct TextLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.vensTextColor)
            .font(.custom("OpenSans-Regular", size: 16))
    }
}

struct AnnotationLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.vensTextColor)
            .font(.custom("OpenSans-Regular", size: 14))
    }
}



