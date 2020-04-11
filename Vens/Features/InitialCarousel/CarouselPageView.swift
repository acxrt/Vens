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
    @State var currentPage = 0
    
    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }
    
    var body: some View {
        
        VStack (spacing: 20) {
            CarouselPageViewController(controllers: viewControllers, currentPage: $currentPage)
            CarouselPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    Image("first")
                    Text("skip")
                }
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 30)
        }
        
    }
}

struct CarouselPageView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselPageView(carouselData.map{ CarouselCardView(carouselCard: $0)} )
        
    }
}
