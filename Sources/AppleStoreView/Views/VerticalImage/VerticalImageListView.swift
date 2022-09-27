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
            ForEach(items) { item in
                VerticalImageView(image: item, onFetchStoreList: onFetchStoreList)
                    .edgesIgnoringSafeArea(.horizontal)
            }
        }
    }
}

@available(iOS 15.0, *)
struct VerticalImageListView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalImageListView(items: [verticalImageData1]){ _,  _ in}
    }
}
