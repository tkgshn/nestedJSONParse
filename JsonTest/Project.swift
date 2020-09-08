import Foundation

struct Ticker: Codable {
    let autopayoutFrom, earning24_Hours: String
    let error: Bool
    let immatureEarning: Double
    let lastPaymentAmount, lastPaymentDate, lastShareDate: String
    let payoutDaily, payoutRequest: Bool
    let totalHashrate, totalHashrateCalculated, transferringToBalance: Double
    let wallet, walletBalance: String
    let workers: [String: Worker]

    enum CodingKeys: String, CodingKey {
        case autopayoutFrom = "autopayout_from"
        case earning24_Hours = "earning_24_hours"
        case error
        case immatureEarning = "immature_earning"
        case lastPaymentAmount = "last_payment_amount"
        case lastPaymentDate = "last_payment_date"
        case lastShareDate = "last_share_date"
        case payoutDaily = "payout_daily"
        case payoutRequest = "payout_request"
        case totalHashrate = "total_hashrate"
        case totalHashrateCalculated = "total_hashrate_calculated"
        case transferringToBalance = "transferring_to_balance"
        case wallet
        case walletBalance = "wallet_balance"
        case workers
    }
}

struct Worker: Codable {
    let alive: Bool
    let hashrate: Double
    let hashrateBelowThreshold: Bool
    let hashrateCalculated: Double
    let lastSubmit: String
    let secondSinceSubmit: Int
    let worker: String

    enum CodingKeys: String, CodingKey {
        case alive, hashrate
        case hashrateBelowThreshold = "hashrate_below_threshold"
        case hashrateCalculated = "hashrate_calculated"
        case lastSubmit = "last_submit"
        case secondSinceSubmit = "second_since_submit"
        case worker
    }
}



// usage examples:


////
////  Project.swift
////  JsonTest
////
////  Created by Shunsuke Takagi on 9/5/20.
////  Copyright © 2020 Shunsuke Takagi. All rights reserved.
////
//
//import SwiftUI
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let project = try? newJSONDecoder().decode(Project.self, from: jsonData)
//
//import Foundation
//
//// MARK: - Project
//struct Project:  Codable {
//    var id: Int
//    var name: String
//    var Description: String
//    var allfavorite: Int
//    var alltime: Int
//    var category: Category
//    var isFavorite: Bool
//    var isFeatured: Bool
//    var contentAudioName: String
//    var phraseList: [PhraseList]
//
//
//    enum Category: String, CaseIterable, Codable, Hashable {
//        case featured = "Featured"
//        case lakes = "Lakes"
//        case rivers = "Rivers"
//        case mountains = "Mountains"
//    }
//}
//
//// MARK: - PhraseList
//struct PhraseList: Codable {
//    var japanese: String
//    var english: String
//    var phraseAudioName: String
//
////    enum CodingKeys: String, CodingKey {
////        case japanese
////        case english
////        case phraseAudioName
////    }
//}
//
//
////struct Project: Codable, Identifiable {
////    let id: Int
////    let name: String
////    let category: Category
////}
////
////struct Category: Codable {
////    let name: String
////    let slug: String
////}
//
////example書こうとしたけど入れ子の場合が分からなかったので断念
////#if DEBUG
////extension Project {
////    static var example: Self {
////        return Project(
////            id: 1,
////            name: "プロダクトのプロジェクトだよ",
////            category:
////            {
////                Project.Category.name: "プロダクト",
////                slug: "product"
////        }
////        )
////    }
////}
////#endif
