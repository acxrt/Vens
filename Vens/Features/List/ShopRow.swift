//
//  ShopRow.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct ShopRow: View {
    
    var shop: Shop
    @EnvironmentObject var userData: UserData
    
    var shopIndex: Int {
        userData.shops.firstIndex(where: {$0.id == shop.id})!
    }
    
    
    var body: some View {
        
        VStack {
            VStack (alignment: .leading, spacing: 5) {
            
                HStack (alignment: .top) {
                Text(shop.category.localized())
                    .modifier(AnnotationLabel())
                Spacer()
                if shop.isOpen != nil {
                    Text(shop.openStatusLocalized())
                        .foregroundColor(.black)
                        .font(.custom("OpenSans-Regular", size: 13))
                        .padding(.horizontal, 15)
                        .padding(.vertical, 2)
                        .background(Color.vensYellow)
                        .cornerRadius(12)
                    
                }
            }
            
            Text(shop.name)
                .modifier(TitleLabel())
            Text(shop.adress)
                .modifier(SubtitleLabel())
            
            if shop.phone != nil {
                Text(shop.phone ?? "")
                .modifier(TextLabel())
            }
            
            if shop.web != nil {
               Text(shop.web ?? "")
                .modifier(TextLabel())
            }
            
            HStack{
                Spacer()
                
            }
            
//            if self.userData.shops[self.shopIndex].isFavourite ?? false {
//                Image(systemName: "star.fill")
//                    .imageScale(.medium)
//                    .onTapGesture {
//                        self.toggleFav()
//                }
//
//            } else {
//                Image(systemName: "star")
//                    .imageScale(.medium)
//                    .onTapGesture {
//                        self.toggleFav()
//                }
//            }
            }.padding(10)
            .padding(.bottom, 12)
            
        }.padding([.top, .horizontal])
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .buttonStyle(PlainButtonStyle())
        .background(Color.clear)
                
    }
    
    func toggleFav() {
        if self.userData.shops[self.shopIndex].isFavourite == nil {
            self.userData.shops[self.shopIndex].isFavourite = true
        } else {
            self.userData.shops[self.shopIndex].isFavourite?.toggle()
        }
    }
}

struct ShopRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopRow(shop: shopData[0])
    }
}
