//
//  ShopsMapView.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct ShopsMapView: View {
    var body: some View {
        NavigationView{
            ZStack {
                MapView()
                
                VStack {
                    NavigationLink(destination: FiltersView()) {
                        
                        HStack {
                            Text("filters")
                                .modifier(TitleLabel())

                            Image("first")
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.vensYellow)
                        .cornerRadius(.infinity)
                    }
                    Spacer()
                }.padding(.top, 30)
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
        }
        
        
    }
}

struct ShopsMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsMapView()
    }
}
