//
//  Project.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/5/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//

import SwiftUI

struct Project: Codable, Identifiable {
    let id: Int
    let name: String
    let category: Category
}

struct Category: Codable {
    let name: String
    let slug: String
}

//example書こうとしたけど入れ子の場合が分からなかったので断念
//#if DEBUG
//extension Project {
//    static var example: Self {
//        return Project(
//            id: 1,
//            name: "プロダクトのプロジェクトだよ",
//            category:
//            {
//                Project.Category.name: "プロダクト",
//                slug: "product"
//        }
//        )
//    }
//}
//#endif
