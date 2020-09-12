//
//  Ticker.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/8/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

// MARK: - AudioContent
struct AudioContent: Codable, Identifiable {
    //    コンテンツのid
    var id: Int
    //    コンテンツのタイトル
    var name: String
    //    コンテンツの概要
    var description: String
    // フレーズの入れ子を作る
    var phrases: [String: Phrase]
    
}


// MARK: - Phrase
struct Phrase: Codable {
    var japanese: String
    var english: String
}


