//
//  Response.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

protocol Response: Codable {}

enum ResponseResult<Response, Failure> where Failure : Error {
    case success(Response)
    case failure(Failure)
}

struct StocksResponse: Response {
    let stocks: [Stock]
}

struct Stock: Response {
    let ticker: String
    let name: String
    let currency: String
    let currentPriceCents: Int
    let quantity: Int?
    let currentPriceTimestamp: UInt
    
    enum CodingKeys: String, CodingKey {
        case ticker
        case name
        case currency
        case currentPriceCents = "current_price_cents"
        case quantity
        case currentPriceTimestamp = "current_price_timestamp"
    }
}
