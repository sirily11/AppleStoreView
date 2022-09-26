//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI
import ACarousel
import AnyCodable

@available(iOS 15.0, *)
public struct AppleStoreView: View {
    private func renderView(list: AppleStoreList<AnyCodable>) -> AnyView {
        switch (list.type) {
        case .carousel:
            let carousels: [CarouselCard] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(CarouselCard.self, from: encoded)
            }
            return AnyView(CarouselListView(carousels: carousels))
        case .verticalList:
            let items: [VerticalListItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(VerticalListItem.self, from: encoded)
            }
            return AnyView(VerticalListView(items: items))
        case .verticalImage:
            let items: [VerticalImageItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(VerticalImageItem.self, from: encoded)
            }
            return AnyView(VerticalImageListView(items: items))
        case .grid:
            let items: [GridItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(GridItem.self, from: encoded)
            }
            return AnyView(GridItemListView(items: items))
        default:
            return AnyView(Text("Not supported"))
        }
    }
    
    public var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(appleStoreList){list in
                    if let title = list.title {
                        Text(title)
                            .fontWeight(.bold)
                            .font(.title)
                            .padding()
                    }
                    renderView(list: list)
                       
                    Divider()
                        .padding([.vertical], 20)
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct AppleStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AppleStoreView()
    }
}
