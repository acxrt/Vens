//
//  ShopsMapView.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI
import MapKit

struct ShopsMapView: View {
    
    @EnvironmentObject var userData: UserData
    @State private var centerCoordinate = CLLocationCoordinate2D(latitude: 41.395171, longitude: 2.162058)
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingPlaceDetails = false
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Group {
                    NavigationLink(destination: ShopDetail(shop: userData.shops[0]), isActive: self.$showingPlaceDetails) {
                        EmptyView()
                    }
                    
                    MapView(centerCoordinate: $centerCoordinate, annotations: userData.shops.filter{$0.id%7 == 0}.map{$0.annotation}, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails)
                    
                }
                
                //                userData.shops.map{$0.annotation}
                
                //                VStack {
                //                    NavigationLink(destination: FiltersView()) {
                //
                //                        HStack(alignment: .center) {
                //                            Text("filters")
                //                                .modifier(TextLabel())
                //                            Image("icFilter")
                //                            .resizable()
                //                            .frame(width: 15, height: 12)
                //                        }
                //                        .padding(.horizontal, 15)
                //                        .padding(.vertical, 5)
                //                        .foregroundColor(.black)
                //                        .background(Color.vensYellow)
                //                        .cornerRadius(.infinity)
                //                    }
                //                    Spacer()
                //                }.padding(.top, 30)
                
                
//                if userData.selectedAnnotation != nil {
//                    
//                    VStack {
//                        Spacer()
////                        ShopPreview()
//                    }
//                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Map")
//            .alert(isPresented: $showingPlaceDetails) {
//                Alert(title: Text("Unknown"), message: Text("Missing place information."), primaryButton: .default(Text("OK")), secondaryButton: .default(Text("Edit")) {
//                    // edit this place
//                })
//            }
        }
        
        
    }
}

struct ShopsMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsMapView()
    }
}
