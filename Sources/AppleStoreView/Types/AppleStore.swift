//
//  File.swift
//  
//
//  Created by Qiwei Li on 9/27/22.
//

import Foundation
import AnyCodable
import SwiftUI

typealias OnDone = ([AppleStoreList<AnyCodable>]) -> Void
typealias OnFetchStoreList = (String, OnDone) -> Void

protocol AppStoreViewProtocol: View {
    var onFetchStoreList: OnFetchStoreList {get}
}
