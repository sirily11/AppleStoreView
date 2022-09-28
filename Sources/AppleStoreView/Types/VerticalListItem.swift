//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation

public struct VerticalListItem: Codable, Identifiable {
    public var id: Int
    public var image: String
    public var label: String?
    public var title: String
    public var link: String
    public var linkText: String
}
