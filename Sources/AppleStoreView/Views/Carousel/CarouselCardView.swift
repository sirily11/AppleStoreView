//
//  SwiftUIView.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import SwiftUI
import Kingfisher

@available(iOS 15.0, *)
struct CarouselCardView: AppStoreViewProtocol {
    let onFetchStoreList: OnFetchStoreList
    
    let carouselCard: CarouselCard
    let backgroundUIColor: UIColor
    let isLightColor: Bool
    
    @State var tap = false
    @State private var isShowingDetailView = false
    
    init(carouselCard: CarouselCard, onFetchStoreList: @escaping OnFetchStoreList) {
        self.carouselCard = carouselCard
        self.backgroundUIColor = UIColor(hexString: carouselCard.backgroundColor)
        self.isLightColor = backgroundUIColor.isLight() ?? false
        self.onFetchStoreList = onFetchStoreList
    }
    
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: AppleStoreView(link: carouselCard.link, onFetchStoreList: onFetchStoreList).navigationTitle(carouselCard.title), isActive: $isShowingDetailView) { EmptyView() }
            
            VStack(alignment: .leading) {
                if let label = carouselCard.label {
                    Text(label)
                        .font(.caption2)
                        .fontWeight(.black)
                        .foregroundColor(.gray)
                }
                Text(carouselCard.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(isLightColor ? .black: .white)
                    .lineLimit(3)
                Text(carouselCard.description)
                    .font(.caption)
                    .foregroundColor(isLightColor ? .black: .white)
            }
            .padding()
            
            KFImage(URL(string: carouselCard.backgroundImage))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            if let action = carouselCard.carouselAction {
                HStack {
                    Text(action.title)
                        .font(.caption)
                        .foregroundColor(isLightColor ? .black: .white)
                    Spacer()
                    Button(action.actionTitle) {
                        
                    }
                    .foregroundColor(.blue)
                    .tint(.gray.opacity(0.2))
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                }
                .padding()
            }
        }
        .frame(height: 500)
        .background(Color(uiColor: backgroundUIColor))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .scaleEffect(tap ? 0.9 : 1)
        .animation(.spring(response: 0.4, dampingFraction: 0.6))
        .onTapGesture {
            tap = true
            isShowingDetailView = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                tap = false
            }
        }
    }
}

@available(iOS 15.0, *)
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CarouselCardView(carouselCard: carouselCard1){ _, onDone in
                onDone(appleStoreList)
            }
        }
    }
}
