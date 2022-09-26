//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/26/22.
//

import Foundation

public struct CarouselCard: Codable, Identifiable {
    public var id = UUID()
    /**
     Carousel card's label
     */
    public var label: String?
    /**
     Carousel card's title
     */
    public var title: String
    /**
     Carousel card's description
     */
    public var description: String
    /**
     Carousel card's background image
     */
    public var backgroundImage: String
    public var backgroundColor: String
    public var carouselAction: CarouselCardAction?
    
}

public struct CarouselCardAction: Codable, Identifiable {
    public var id = UUID()
    /**
    Carousel's title
     */
    public var title: String
    /**
     Carousel's action button title
     */
    public var actionTitle: String
    /**
     Carousel's action button link
     */
    public var actionLink: String
}
