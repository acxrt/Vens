//
//  CarouselPageView.swift
//  Vens
//
//  Created by Albert on 11/04/2020.
//  Copyright © 2020 Aina Cuxart. All rights reserved.
//

import SwiftUI

struct CarouselPageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @EnvironmentObject var userData: UserData
    @State var currentPage = 0
    @State private var showContent = false
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20) {
                CarouselPageViewController(controllers: viewControllers, currentPage: $currentPage)
                CarouselPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                Spacer()
                VStack(alignment: .trailing) {
//                    NavigationLink(destination: ContentView()) {
                        HStack {
                            Text("skip")
                            ZStack {
                                Circle().foregroundColor(Color.vensYellow)
                                Image("rightArrow")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color.vensDarkPurple)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 25, height: 25)
                            }.frame(width: 50, height: 50)
                        }
//                  }
                }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                Spacer().frame(height: 50)
//                Button(action: { self.showContent = true }) {
//                  Image(systemName: "mappin.and.ellipse")
//                }
//                .sheet(isPresented: $showContent) {
//                  ContentView()
//                }
            }
        }.navigationBarHidden(true)
    }
}

struct CarouselPageView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselPageView(carouselData.map{ CarouselCardView(carouselCard: $0)} )
        
    }
}
