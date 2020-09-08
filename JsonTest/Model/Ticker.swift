//
//  Ticker.swift
//  JsonTest
//
//  Created by Shunsuke Takagi on 9/8/20.
//  Copyright © 2020 Shunsuke Takagi. All rights reserved.
//


import SwiftUI

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
