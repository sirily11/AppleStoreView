//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 14.0, *)
struct VerticalListView: View {
    let items: [VerticalListItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(items) { item in
                HStack {
                    Spacer()
                    VerticalListItemView(item: item)
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
        VerticalListView(items: [verticalListData1, verticalListData2])
    }
}
