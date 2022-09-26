//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct CarouselListView: View {
    let carousels: [CarouselCard]
    
    var body: some View {
        TabView {
            ForEach(carousels) { card in
                CarouselCardView(carouselCard: card)
                    .padding([.horizontal])
                    .tag(card.title)
            }
        }
        .frame(height: 500)
        .tabViewStyle(.page)
    }
}

@available(iOS 15.0, *)
struct CarouselListView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselListView(carousels: [carouselCard1, carouselCard2, carouselCard3])
    }
}
