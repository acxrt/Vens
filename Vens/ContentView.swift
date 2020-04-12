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
        UITabBar.appearance().backgroundColor = UIColor.white

    }

    
    var body: some View {
        
        TabView(selection: $selection){
            ShopList()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("icList")
                    }
                }
                .tag(0)
            ShopsMapView()
                .edgesIgnoringSafeArea(.top)
                
                .font(.title)
                .tabItem {
                    VStack {
                        Image("locationIcon")
                        .renderingMode(.template) .foregroundColor(Color.vensLightPurple)
                    }
                }
                .tag(1)
            FavouritesList()
            .font(.title)
            .tabItem {
                VStack {
                    Image("favouriteIcon")
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
