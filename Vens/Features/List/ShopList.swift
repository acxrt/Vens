//
//  ShopList.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct ShopList: View {
    
    @EnvironmentObject var userData: UserData
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        
        NavigationView {
            List(userData.shops) { shop in
                if !self.userData.showOpenShopsOnly || (shop.isOpen ?? false) {
                    
                    ZStack {
                        ShopRow(shop: shop)
                        NavigationLink(destination: ShopDetail(shop: shop)) {
                                EmptyView()
                        }.buttonStyle(PlainButtonStyle())
                    }.listRowBackground(Color.clear)
                }
            }
            .listSeparatorStyleNone()
            .navigationBarTitle("shops")
        }
    }
}

struct ShopList_Previews: PreviewProvider {
    static var previews: some View {
        ShopList()
            .environmentObject(UserData())
    }
}
