//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/30/22.
//

import SwiftUI

struct WebViewListView: View {
    let items: [WebViewItem]
    let height: Double
    
    var body: some View {
        GeometryReader{ geo in
            if let first = items.first {
                WebViewItemView(item: first)
                    .frame(height: height)
            } else {
                EmptyView()
            }
        }
    }
}

struct WebViewListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WebViewListView(items: [WebViewItem(id: 1, link: "https://google.com")], height: 800)
                .navigationTitle("Google")
        }
    }
}
