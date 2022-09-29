//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/30/22.
//

import SwiftUI
import WebViewKit

public struct WebViewItemView: View {
    let item: WebViewItem
    
    public init(item: WebViewItem) {
        self.item = item
    }
    
    public var body: some View {
        WebView(url: URL(string: item.link))
    }
}

struct WebViewItemView_Previews: PreviewProvider {
    static var previews: some View {
        WebViewItemView(item: .init(id: 1, link: "https://google.com"))
    }
}
