//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation
import AnyCodable


public enum ListType: String, CaseIterable, Codable {
    case carousel, horizontal, grid, verticalImage, verticalList
}

public struct AppleStoreList<T: Codable>: Identifiable, Codable {
    public var id: Int
    public var type: ListType
    public var items: [AppleStoreListItem<T>]
    public var title: String?
}

public struct AppleStoreListItem<T: Codable>: Identifiable, Codable {
    public var id: Int
    public var content: T
}
