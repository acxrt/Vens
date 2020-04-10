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
        HStack{
            Text(shop.name)
            Spacer()
            
            if self.userData.shops[self.shopIndex].isFavourite ?? false {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .onTapGesture {
                        self.toggleFav()
                    }
                
            } else {
                Image(systemName: "star")
                    .imageScale(.medium)
                    .onTapGesture {
                        self.toggleFav()
                    }
            }
            
        }.padding()
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
