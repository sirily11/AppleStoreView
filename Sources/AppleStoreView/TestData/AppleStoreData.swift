//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation
import AnyCodable

let appleStoreList: [AppleStoreList<AnyCodable>] = [
    AppleStoreList(id: 1, type: .carousel, items: [AppleStoreListItem(id: 20, content: .init(carouselCard1)), AppleStoreListItem(id: 21, content: .init(carouselCard2))]),
    AppleStoreList(id: 2, type: .verticalList, items: [AppleStoreListItem(id: 22, content: .init(verticalListData1)), AppleStoreListItem(id: 23, content: .init(verticalListData2))], title: "Latest iPhones"),
    AppleStoreList(id: 3, type: .verticalImage, items: [AppleStoreListItem(id: 24, content: .init(verticalImageData1)), AppleStoreListItem(id: 25, content: .init(verticalImageData2))], title: "Latest iPhones"),
    AppleStoreList(id: 4, type: .grid, items: [AppleStoreListItem(id: 26, content: .init(gridItemData1)), AppleStoreListItem(id: 27, content: .init(gridItemData2)), AppleStoreListItem(id: 28, content: .init(gridItemData3)), AppleStoreListItem(id: 29, content: .init(gridItemData4)), AppleStoreListItem(id: 30, content: .init(gridItemData5)), AppleStoreListItem(id: 31, content: .init(gridItemData6))], title: "Latest iPhones")
]
