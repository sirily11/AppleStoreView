//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI
import Kingfisher

@available(iOS 15.0, *)
struct VerticalListItemView: AppStoreViewProtocol {
    let onFetchStoreList: OnFetchStoreList
    
    let item: VerticalListItem
    
    @State var isShowingDetailView = false
    
    init(item: VerticalListItem, onFetchStoreList: @escaping OnFetchStoreList) {
        self.onFetchStoreList = onFetchStoreList
        self.item = item
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: AppleStoreView(link: item.link, onFetchStoreList: onFetchStoreList).navigationTitle(item.title), isActive: $isShowingDetailView) { EmptyView() }
            
            KFImage(URL(string: item.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            if let label = item.label {
                Text(label)
                    .foregroundColor(.orange)
                    .font(.callout)
            }
            Text(item.title)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: 300)
                .multilineTextAlignment(.center)
            
            Text(item.linkText)
                .foregroundColor(.blue)
                .onTapGesture {
                    isShowingDetailView = true
                }
        }
    }
}

@available(iOS 15.0, *)
struct VerticalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VerticalListItemView(item: verticalListData1){_, onDone in
                onDone(appleStoreList)
            }
        }
    }
}
