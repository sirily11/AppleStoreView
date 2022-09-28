//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import Foundation
import AnyCodable
import SwiftUI

public typealias OnDone = ([AppleStoreList<AnyCodable>]) -> Void
public typealias OnFetchStoreList = (String, OnDone) -> Void

protocol AppStoreViewProtocol: View {
    var onFetchStoreList: OnFetchStoreList {get}
}
