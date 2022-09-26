//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI
import Kingfisher

@available(iOS 14.0, *)
struct VerticalListItemView: View {
    let item: VerticalListItem
    
    var body: some View {
        VStack {
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
        }
    }
}

@available(iOS 14.0, *)
struct VerticalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalListItemView(item: verticalListData1)
    }
}
