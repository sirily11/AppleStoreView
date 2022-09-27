//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct GridItemView: AppStoreViewProtocol {
    let item: GridItem
    let onFetchStoreList: OnFetchStoreList
    
    init(item: GridItem, onFetchStoreList: @escaping OnFetchStoreList) {
        self.item = item
        self.onFetchStoreList = onFetchStoreList
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(1)
            HStack {
                Spacer()
                KFImage(URL(string: item.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                Spacer()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        
    }
}

@available(iOS 14.0, *)
struct GridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(item: gridItemData1){ _, _ in
            
        }
    }
}
