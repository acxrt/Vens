
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
        VStack {
            Image(carouselCard.imageName)
            Text(carouselCard.title)
            Text(carouselCard.text)
            

        }.padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}

struct CarouselCardView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCardView(carouselCard: carouselData[0])
    }
}
