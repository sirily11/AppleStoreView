//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation
import AnyCodable

let appleStoreList: [AppleStoreList<AnyCodable>] = [
    AppleStoreList(type: .carousel, items: [AppleStoreListItem(content: .init(carouselCard1)), AppleStoreListItem(content: .init(carouselCard2))]),
    AppleStoreList(type: .verticalList, items: [AppleStoreListItem(content: .init(verticalListData1)), AppleStoreListItem(content: .init(verticalListData2))], title: "Latest iPhones"),
    AppleStoreList(type: .verticalImage, items: [AppleStoreListItem(content: .init(verticalImageData1)), AppleStoreListItem(content: .init(verticalImageData2))], title: "Latest iPhones"),
    AppleStoreList(type: .grid, items: [AppleStoreListItem(content: .init(gridItemData1)), AppleStoreListItem(content: .init(gridItemData2)), AppleStoreListItem(content: .init(gridItemData3)), AppleStoreListItem(content: .init(gridItemData4)), AppleStoreListItem(content: .init(gridItemData5)), AppleStoreListItem(content: .init(gridItemData6))], title: "Latest iPhones")
]
