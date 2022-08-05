//
//  DataProvider.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

protocol DataProvider {
}

typealias ResultResponse = Result<Response, Error>

protocol RemoteDataProvider: DataProvider {
    func fetchData(_ request: NetworkRequest, completion: @escaping (ResultResponse) -> Void)
}
