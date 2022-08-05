//
//  Request.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation
protocol Request {
    var url: URL? { get}
}

enum RequestURLStr: String {
    case portfolio = "/portfolio.json"
    case portfolioMalformed = "/portfolio_malformed.json"
    case portfolioEmpty = "/portfolio_empty.json"
    case emptyURLString = ""
}

class NetworkRequest: Request{
    private let host = "https://storage.googleapis.com"
    private let path = "/cash-homework/cash-stocks-api"
    private let str: RequestURLStr
    
    //"https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    var url: URL? {
        get {
            var urlComponents = URLComponents(string: host)
            urlComponents?.path = path + str.rawValue
            return urlComponents?.url
        }
    }
    
    init(_ str: RequestURLStr) {
        self.str = str
    }
}

