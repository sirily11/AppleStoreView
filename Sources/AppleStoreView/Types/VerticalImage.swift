//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation

public struct VerticalImageItem: Codable, Identifiable {
    public var id: Int
    public var title: String
    public var description: String?
    public var backgroundColor: String?
    public var image: String
    public var link: String
    public var linkTitle: String
}
