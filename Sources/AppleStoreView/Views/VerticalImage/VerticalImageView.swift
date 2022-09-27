//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import SwiftUI
import Kingfisher

@available(iOS 15.0, *)
struct VerticalImageView: AppStoreViewProtocol {
    let image: VerticalImageItem
    let backgroundUIColor: UIColor?
    let isLightColor: Bool
    let onFetchStoreList: OnFetchStoreList
    
    @State var isShowingDetailView = false
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    var textColor: Color? {
        if backgroundUIColor != nil {
            if isLightColor {
                return .black
            }
            return .white
        }
        
        return nil
    }
    
    init(image: VerticalImageItem, onFetchStoreList: @escaping OnFetchStoreList) {
        self.image = image
        self.onFetchStoreList = onFetchStoreList
        if let backgroundUIColor = image.backgroundColor {
            self.backgroundUIColor = UIColor(hexString: backgroundUIColor)
            self.isLightColor = self.backgroundUIColor?.isLight() ?? false
        } else {
            self.backgroundUIColor = nil
            self.isLightColor = false
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: AppleStoreView(link: image.link, onFetchStoreList: onFetchStoreList).navigationTitle(image.title), isActive: $isShowingDetailView) { EmptyView() }
            
            HStack {
                Text(image.title)
                    .foregroundColor(textColor)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal, .top])
            HStack {
                Text(image.description)
                    .foregroundColor(textColor)
            }
            .padding([.horizontal])
            HStack {
                Text(image.linkTitle)
                    .foregroundColor(.blue)
                    .onTapGesture {
                        isShowingDetailView = true
                    }
            }
            .padding([.horizontal])
            Spacer()
            HStack {
                Spacer()
                KFImage(URL(string: image.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                Spacer()
            }
        }
        .frame(height: 450)
        .background(backgroundUIColor != nil ? Color(uiColor: backgroundUIColor!) : nil)
    }
}

@available(iOS 15.0, *)
struct VerticalImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VerticalImageView(image: verticalImageData1) { _, onDone in
                onDone(appleStoreList)
            }
        }
        NavigationView {
            VerticalImageView(image: verticalImageData2){ _, onDone in
                onDone(appleStoreList)
            }
        }
    }
}
