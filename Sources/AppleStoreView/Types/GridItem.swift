//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import Foundation

public struct GridItem: Codable, Identifiable {
    public var id = UUID()
    public var title: String
    public var image: String
    public var link: String
}
