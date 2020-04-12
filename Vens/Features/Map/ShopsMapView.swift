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
    
    @ObservedObject var locationManager = LocationManager()
    @EnvironmentObject var userData: UserData
    @State private var centerCoordinate = CLLocationCoordinate2D(latitude: 41.395171, longitude: 2.162058)
//    @State var locations : [MKPointAnnotation] = []
    
    init() {
        if let coord = locationManager.lastLocation?.coordinate {
            centerCoordinate = coord
            print(coord.latitude)
        }
    }
    
    var body: some View {
        
        NavigationView{
            ZStack {
//                self.getLocations()
                MapView(centerCoordinate: $centerCoordinate, annotations: userData.shops.filter{$0.id%7 == 0}.map{$0.annotation} , annotationsDidUpdate: true)
                    
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
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("Map")
        }
        
        
    }
}

struct ShopsMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopsMapView()
    }
}
