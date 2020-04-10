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
        VStack {
            CarouselPageViewController(controllers: viewControllers, currentPage: $currentPage)
            CarouselPageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.trailing)
        }
    }
}

struct CarouselPageView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselPageView(carouselData.map{ CarouselCardView(carouselCard: $0)} )
    }
}
