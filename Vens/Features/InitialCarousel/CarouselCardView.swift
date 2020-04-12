
//
//  CarouselCardView.swift
//  Vens
//
//  Created by Albert on 11/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct CarouselCardView: View {
    
    var carouselCard: CarouselCard
    
    var body: some View {
        VStack(spacing: 40) {
            Image(carouselCard.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: nil, height: 250.0)
            VStack(spacing: 20) {
                Text(carouselCard.title)
                Text(carouselCard.text)
                    .modifier(TextLabel())
                    .lineLimit(0)
            }
        }.padding(30)
        
    }
}

struct CarouselCardView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCardView(carouselCard: carouselData[0])
    }
}
