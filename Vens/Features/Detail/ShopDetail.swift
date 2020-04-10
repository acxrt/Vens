//
//  ShopDetail.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct ShopDetail: View {
    
    var shop: Shop
    
    var body: some View {
        VStack {
        Text(shop.name)
        }.navigationBarTitle(Text(shop.name), displayMode: .inline)
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetail(shop: shopData[0])
    }
}
