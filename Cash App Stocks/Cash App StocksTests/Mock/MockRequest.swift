//
//  MockRequest.swift
//  Cash App StocksTests
//
//  Created by Mingjun Lei on 8/4/22.
//

import Foundation
@testable import Cash_App_Stocks

class MockNetworkRequest: NetworkRequest {
    init(){
        super.init(.emptyURLString)
    }
}
