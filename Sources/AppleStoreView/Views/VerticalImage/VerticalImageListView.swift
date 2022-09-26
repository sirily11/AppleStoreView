//
//  SwiftUIView.swift
//
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI

@available(iOS 15.0, *)
struct VerticalImageListView: View {
    let items: [VerticalImageItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(items) { item in
                VerticalImageView(image: item)
                    .edgesIgnoringSafeArea(.horizontal)
            }
        }
    }
}

@available(iOS 15.0, *)
struct VerticalImageListView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalImageListView(items: [verticalImageData1])
    }
}
