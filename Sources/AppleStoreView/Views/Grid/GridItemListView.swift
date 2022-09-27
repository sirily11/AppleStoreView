//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct GridItemListView: AppStoreViewProtocol {
    let onFetchStoreList: OnFetchStoreList
    
    let items: [GridItem]
    
    init(items: [GridItem], onFetchStoreList: @escaping OnFetchStoreList) {
        self.onFetchStoreList = onFetchStoreList
        self.items = items
    }
    
    private let gridItemLayout = [
        SwiftUI.GridItem(.flexible()),
        SwiftUI.GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 10)  {
            ForEach(items) { item in
                GridItemView(item: item, onFetchStoreList: onFetchStoreList)
                    .frame(minHeight: 280)
            }
        }
        .padding()
    }
}

@available(iOS 14.0, *)
struct GridItemListView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            GridItemListView(items: [gridItemData1, gridItemData2, gridItemData3, gridItemData4]){ _, _ in
                
            }
        }
    }
}
