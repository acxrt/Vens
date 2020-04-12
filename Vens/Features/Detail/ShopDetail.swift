//
//  ShopDetail.swift
//  Vens
//
//  Created by Albert on 10/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI
//import RealmSwift

struct ShopDetail: View {
    
    var shop: Shop
    @EnvironmentObject var userData: UserData
    
    var shopIndex: Int {
        userData.shops.firstIndex(where: {$0.id == shop.id})!
    }
    
    var body: some View {
//                NavigationView {
        VStack(alignment: .leading, spacing: 0) {
            Image(shop.imageName)
                .resizable()
                .frame(height: 300)
            ZStack {
                
                Capsule()
                    .frame(height: 50)
                    .offset(x: 0, y: -25)
                    .foregroundColor(Color.white)
                
                HStack(alignment: .top) {
                    
                    Spacer()
                    
                    ZStack {
                        Circle().foregroundColor(Color.vensYellow)
                        
                        if self.userData.shops[self.shopIndex].isFavourite ?? false {
                            Image("icFavourites")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.vensDarkPurple)
                                .frame(width: 25, height: 25)
                            
                        } else {
                            Image("icFavourites")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    }.frame(width: 50, height: 50)
                        .offset(x: 0, y: -50)
                        .onTapGesture {
                            self.toggleFav()
                    }
                    
                    
                }
                .padding(.trailing, 20)
                
            }
            
            VStack (alignment: .leading, spacing: 25) {
                Text(shop.category.localized())
                    .modifier(AnnotationLabel())
                
                VStack(alignment: .leading)  {
                    HStack {
                        Text(shop.name)
                            .modifier(TitleLabel())
                            .lineLimit(0)
                        Spacer()
                        if (shop.isOpen != nil) {
                            Text(shop.openStatusLocalized())
                                .foregroundColor(.black)
                                .font(.custom("OpenSans-Regular", size: 13))
                                .padding(.horizontal, 15)
                                .padding(.vertical, 2)
                                .background(Color.vensLightPurple)
                                .cornerRadius(.infinity)
                            
                        }
                        
                    }
                    Text(shop.adress)
                        .modifier(SubtitleLabel())
                }
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Image("locationIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                        Text(shop.distanceToMe())
                            .modifier(TextLabel())
                    }
                    if shop.phone != nil {
                        HStack(alignment: .center) {
                            Image("phoneIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                            
                            Button(action: {
                                
                                // validation of phone number not included
                                let dash = CharacterSet(charactersIn: "-")
                                
                                let cleanString =
                                    self.shop.phone!.trimmingCharacters(in: dash)
                                
                                let tel = "tel://"
                                let formattedString = tel + cleanString
                                let url: NSURL = URL(string: formattedString)! as NSURL
                                
                                UIApplication.shared.open(url as URL)
                                
                            }) {
                                Text(shop.phone ?? "")
                                    .modifier(TextLabel())
                            }
                            
                        }
                    }
                    if shop.web != nil {
                        HStack(alignment: .center) {
                            Image("webIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 15, height: 15)
                            
                            Button(action: {
                                if let url = URL(string: self.shop.web ?? "") as NSURL? {
                                    UIApplication.shared.open(url as URL)
                                }
                            }) {
                                Text(shop.web ?? "")
                                    .modifier(TextLabel())
                            }
                        }
                    }
                }
            }
            .offset(x: 0, y: -50)
            .padding(.top)
            .padding(.horizontal, 25)
            
            Spacer()
            
        }
        .navigationBarTitle("", displayMode: .inline)
                    
//        }
        
    }
    
    func toggleFav() {
//        let realm = try! Realm()
        if self.userData.shops[self.shopIndex].isFavourite == nil {
            print(self.userData.shops[self.shopIndex].isFavourite)
//            try! realm.write {
                self.userData.shops[self.shopIndex].isFavourite = true
//            }
            print(self.userData.shops[self.shopIndex].isFavourite)
        } else {
//            try! realm.write {
                self.userData.shops[self.shopIndex].isFavourite?.toggle()
//            }
        }
    }
}

struct ShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetail(shop: shopData[1])
    }
}
