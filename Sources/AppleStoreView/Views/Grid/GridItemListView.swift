//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct GridItemListView: View {
    let items: [GridItem]
    
    private let gridItemLayout = [
        SwiftUI.GridItem(.flexible()),
        SwiftUI.GridItem(.flexible()),
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItemLayout, spacing: 10)  {
            ForEach(items) { item in
                GridItemView(item: item)
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
            GridItemListView(items: [gridItemData1, gridItemData2, gridItemData3, gridItemData4])
        }
    }
}
