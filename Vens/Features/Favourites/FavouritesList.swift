//
//  FavouritesList.swift
//  Vens
//
//  Created by Albert on 11/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct FavouritesList: View {
    @EnvironmentObject var userData: UserData
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        
        NavigationView {
            if hasFavourites() {
                List(userData.shops.filter({$0.isFavourite ?? false})) { shop in
                    if shop.isFavourite ?? false {
                        ZStack {
                            ShopRow(shop: shop)
                            NavigationLink(destination: ShopDetail(shop: shop)) {
                                    EmptyView()
                            }.buttonStyle(PlainButtonStyle())
                        }.listRowBackground(Color.clear)
                    }
                }
                .listSeparatorStyleNone()
                .navigationBarTitle("favourites")
                Spacer()
            } else {
                VStack(spacing: 45){
                    Image("noFavouritesIlustration")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: nil, height: 300.0)
                        
                    VStack (spacing: 15){ Text("emptyFavsTitle").modifier(TitleLabel())
                    Text("emptyFavsText").modifier(TextLabel())
                    }
                    
                }.navigationBarTitle("favourites")
                    .padding(.vertical, 30)
                    .padding(.horizontal, 40)
            }
        }
    }
    
    func hasFavourites () -> Bool {
        return (userData.shops.filter({($0.isFavourite ?? false ) == true }).count != 0)
    }
}

struct FavouritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesList()
            .environmentObject(UserData())
    }
}
