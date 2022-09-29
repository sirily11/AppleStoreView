//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation
import AnyCodable


public enum ListType: String, CaseIterable, Codable {
    case carousel, horizontal, grid, verticalImage, verticalList, webview
}

public struct AppleStoreList<T: Codable>: Identifiable, Codable {
    public var id: Int
    public var type: ListType
    public var items: [AppleStoreListItem<T>]
    public var title: String?
    
    public init(id: Int, type: ListType, items: [AppleStoreListItem<T>], title: String? = nil) {
        self.id = id
        self.type = type
        self.items = items
        self.title = title
    }
}

public struct AppleStoreListItem<T: Codable>: Identifiable, Codable {
    public var id: Int
    public var content: T
    
    public init(id: Int, content: T) {
        self.id = id
        self.content = content
    }
}
