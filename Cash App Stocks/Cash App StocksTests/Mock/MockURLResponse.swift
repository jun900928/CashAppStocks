//
//  MockResponse.swift
//  Cash App StocksTests
//
//  Created by Mingjun Lei on 8/4/22.
//

import Foundation
@testable import Cash_App_Stocks

class MockURLResponse: HTTPURLResponse {
    
    init? (_ statusCode: HTTPStatusCode = .ok) {
        super.init(url: URL.init(string: "https://www.google.com")!,
                   statusCode: statusCode.rawValue,
                   httpVersion: nil,
                   headerFields: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
