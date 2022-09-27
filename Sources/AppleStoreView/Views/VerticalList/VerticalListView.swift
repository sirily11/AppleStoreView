//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct VerticalListView: AppStoreViewProtocol {
    let items: [VerticalListItem]
    let onFetchStoreList: OnFetchStoreList
    
    init(items: [VerticalListItem], onFetchStoreList: @escaping OnFetchStoreList) {
        self.items = items
        self.onFetchStoreList = onFetchStoreList
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(items) { item in
                HStack {
                    Spacer()
                    VerticalListItemView(item: item, onFetchStoreList: onFetchStoreList)
                    Spacer()
                }
                .padding([.vertical], 40)
            }
        }
    }
}

@available(iOS 14.0, *)
struct VerticalListView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalListView(items: [verticalListData1, verticalListData2]){ _, _ in }
    }
}
