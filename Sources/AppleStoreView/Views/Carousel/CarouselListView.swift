//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct CarouselListView: AppStoreViewProtocol {
    let carousels: [CarouselCard]
    let onFetchStoreList: OnFetchStoreList
    
    init(carousels: [CarouselCard], onFetchStoreList: @escaping OnFetchStoreList) {
        self.carousels = carousels
        self.onFetchStoreList = onFetchStoreList
    }
    
    var body: some View {
        TabView {
            ForEach(carousels) { card in
                CarouselCardView(carouselCard: card, onFetchStoreList: onFetchStoreList)
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
        CarouselListView(carousels: [carouselCard1, carouselCard2, carouselCard3]){link, onDone in
            
        }
    }
}
