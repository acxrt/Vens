//
//  ContentView.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    init() {
        UITabBar.appearance().tintColor = Color.vensLightPurple.asUIColor()
    }

    
    var body: some View {
        
        TabView(selection: $selection){
            ShopList()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("listIcon")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                    }
                }
                .tag(0)
            ShopsMapView()
                .edgesIgnoringSafeArea(.top)
                
                .font(.title)
                .tabItem {
                    VStack {
                        Image("locationIcon")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .aspectRatio(contentMode: .fit)
                    }
                }
                .tag(1)
            FavouritesList()
            .font(.title)
            .tabItem {
                VStack {
                    Image("favouriteIcon")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .aspectRatio(contentMode: .fit)
                }
            }
            .tag(2)
        }.accentColor(Color.vensDarkPurple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
