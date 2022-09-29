//
//  SwiftUIView.swift
//
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct VerticalImageListView: AppStoreViewProtocol {
    let items: [VerticalImageItem]
    let onFetchStoreList: OnFetchStoreList
    
    init(items: [VerticalImageItem], onFetchStoreList: @escaping OnFetchStoreList) {
        self.items = items
        self.onFetchStoreList = onFetchStoreList
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<items.count, id: \.self) { index in
                VerticalImageView(image: items[index], onFetchStoreList: onFetchStoreList)
                    .edgesIgnoringSafeArea(.horizontal)
                
                if index < items.count - 1 {
                    Divider()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct VerticalImageListView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalImageListView(items: [verticalImageData1, verticalImageData2]){ _,  _ in}
    }
}
