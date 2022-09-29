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
public struct AppleStoreView: AppStoreViewProtocol {
    @State var isLoading = false
    @State var storeList: [AppleStoreList<AnyCodable>] = []
    
    let link: String
    let onFetchStoreList: OnFetchStoreList
    
    public init(link: String, onFetchStoreList: @escaping OnFetchStoreList) {
        self.link = link
        self.onFetchStoreList = onFetchStoreList
    }
    
    public var body: some View {
        Group {
            if let first = storeList.first, first.type == .webview, let firstItem = first.items.first {
                // if view is webview
                let encoded = try! JSONEncoder().encode(firstItem.content)
                let item = try! JSONDecoder().decode(WebViewItem.self, from: encoded)
                WebViewItemView(item: item)
            } else {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(storeList){list in
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
                .onAppear{
                    fetch()
                }
            }
        }
    }
    
    private func fetch()  {
        DispatchQueue.main.async {
            isLoading = true
            onFetchStoreList(link){list in
                storeList = list
            }
            isLoading = false
        }
    }
}

@available(iOS 15.0, *)
extension AppleStoreView {
    func renderView(list: AppleStoreList<AnyCodable>) -> AnyView {
        switch (list.type) {
        case .carousel:
            let carousels: [CarouselCard] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(CarouselCard.self, from: encoded)
            }
            return AnyView(CarouselListView(carousels: carousels, onFetchStoreList: onFetchStoreList))
        case .verticalList:
            let items: [VerticalListItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(VerticalListItem.self, from: encoded)
            }
            return AnyView(VerticalListView(items: items, onFetchStoreList: onFetchStoreList))
        case .verticalImage:
            let items: [VerticalImageItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(VerticalImageItem.self, from: encoded)
            }
            return AnyView(VerticalImageListView(items: items, onFetchStoreList: onFetchStoreList))
        case .grid:
            let items: [GridItem] = list.items.map { item in
                let encoded = try! JSONEncoder().encode(item.content)
                return try! JSONDecoder().decode(GridItem.self, from: encoded)
            }
            return AnyView(GridItemListView(items: items, onFetchStoreList: onFetchStoreList))
        default:
            return AnyView(Text("Not supported"))
        }
    }
}

@available(iOS 15.0, *)
struct AppleStoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppleStoreView(link: "") { link, onDone in
                onDone(appleStoreList)
            }
            .navigationTitle("Apple Store")
        }
        
    }
}
