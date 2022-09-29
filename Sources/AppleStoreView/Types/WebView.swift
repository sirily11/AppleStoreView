//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/30/22.
//

import Foundation

public struct WebViewItem: Codable, Identifiable {
    public var id: Int
    public var link: String
    
    public init(id: Int, link: String) {
        self.id = id
        self.link = link
    }
}
