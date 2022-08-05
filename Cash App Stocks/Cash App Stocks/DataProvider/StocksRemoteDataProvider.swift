//
//  StocksRemoteDataProvider.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation
class StocksRemoteDataProvider: NSObject {
    private var stocks: [Stock]?
    
    private let serviceProvider: Service
    
    init(_ serviceProvider: Service = NetworkService.instance) {
        self.serviceProvider = serviceProvider
    }
}

typealias StocksResponseResult = Result<StocksResponse, Error>

extension StocksRemoteDataProvider: RemoteDataProvider {
    
    /// Fetch data from server base on request
    /// - Parameters:
    ///   - request: Network Request bacs on url
    ///   - completion: completion handler after get repsonse 
    func fetchData(_ request: NetworkRequest, completion: @escaping (ResultResponse) -> Void) {
        serviceProvider.request(request: request) { [ weak self](_ result: StocksResponseResult) in
            guard let self = self else {return}
            switch result {
            case .success(let repsonse):
                self.stocks = repsonse.stocks
                completion(.success(repsonse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

extension StocksRemoteDataProvider: StocksListViewControllerDataProvider {
    var stocksList: [Stock] {
        return self.stocks ?? []
    }
}

