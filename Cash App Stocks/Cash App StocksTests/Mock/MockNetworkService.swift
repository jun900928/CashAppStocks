//
//  MockNetworkService.swift
//  Cash App StocksTests
//
//  Created by Mingjun Lei on 8/4/22.
//

import Foundation
@testable import Cash_App_Stocks

//Mock the service provi
class MockService: Service {
    private let decoder = JSONDecoder()
    
    let data: Data?
    let response: HTTPURLResponse?
    let error: Error?
    
    init(data: Data? = nil, response: HTTPURLResponse? = MockURLResponse(.ok), error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func request<T: Decodable>(request: Request, completion: @escaping (Result<T, Error>) -> Void) {
        parsing(data: data, response: response, error: error, completion: completion)
    }
    
    func parsing<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, Error>) -> Void) {
        guard let data = data,
            let response = response as? HTTPURLResponse,
            response.statusCode == 200 else {
            completion(.failure(NetworkError.serverError))
            return
        }
        do {
            let response = try self.decoder.decode(T.self, from: data)
            completion(.success(response))
        } catch {
            print(error)
            completion(.failure(NetworkError.decodeFail))
        }
    }
}
