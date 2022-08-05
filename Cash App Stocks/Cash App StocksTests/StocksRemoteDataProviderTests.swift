//
//  StocksRemoteDataProviderTests.swift
//  Cash App StocksTests
//
//  Created by Mingjun Lei on 8/4/22.
//

import XCTest
@testable import Cash_App_Stocks

class StocksRemoteDataProviderTests: XCTestCase {

    func testDataload_mockdata() throws {
        let mockService = MockService.init(data: mockData)
        let stocksRemoteDataProvider = StocksRemoteDataProvider(mockService)
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(MockNetworkRequest()) { result  in
            switch result {
                case .success(let reponse):
                    XCTAssertTrue(!stocksRemoteDataProvider.stocksList.isEmpty)
                    XCTAssertTrue(reponse is StocksResponse)
                case .failure(_):
                    XCTAssertTrue(false)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)

    }
    
    func testDataload_mockempty() throws {
        let mockService = MockService.init(data: mockEmptyData)
        let stocksRemoteDataProvider = StocksRemoteDataProvider(mockService)
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(MockNetworkRequest()) { result in
            switch result {
                case .success(let reponse):
                    XCTAssertTrue(stocksRemoteDataProvider.stocksList.isEmpty)
                    XCTAssertTrue(reponse is StocksResponse)
                case .failure(_):
                    XCTAssertTrue(false)
                    break
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testDataload_mockmalformed() throws {
        let mockService = MockService.init(data: mockMalformedData)
        let stocksRemoteDataProvider = StocksRemoteDataProvider(mockService)
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(MockNetworkRequest()) { result  in
            switch result {
                case .success(_):
                    XCTAssertTrue(false)
                case .failure(let error):
                XCTAssertNotNil(error.localizedDescription)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testDataload_data() throws {
        let stocksRemoteDataProvider = StocksRemoteDataProvider()
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(NetworkRequest(.portfolio)) { result  in
            switch result {
                case .success(let reponse):
                    XCTAssertTrue(!stocksRemoteDataProvider.stocksList.isEmpty)
                    XCTAssertTrue(reponse is StocksResponse)
                case .failure(_):
                    XCTAssertTrue(false)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)

    }
    
    func testDataload_empty() throws {
        let stocksRemoteDataProvider = StocksRemoteDataProvider()
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(NetworkRequest(.portfolioEmpty)) { result in
            switch result {
                case .success(let reponse):
                    XCTAssertTrue(stocksRemoteDataProvider.stocksList.isEmpty)
                    XCTAssertTrue(reponse is StocksResponse)
                case .failure(_):
                    XCTAssertTrue(false)
                    break
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testDataload_malformed() throws {
        let stocksRemoteDataProvider = StocksRemoteDataProvider()
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(NetworkRequest(.portfolioMalformed)) { result  in
            switch result {
                case .success(_):
                    XCTAssertTrue(false)
                case .failure(let error):
                XCTAssertNotNil(error.localizedDescription)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testDataload_server_error() throws {
        let urlresponse = MockURLResponse.init(.notFound)
        let mockService = MockService.init(data: mockData, response: urlresponse)
        let stocksRemoteDataProvider = StocksRemoteDataProvider(mockService)
        let exp = expectation(description: "Loading URL")
        stocksRemoteDataProvider.fetchData(MockNetworkRequest()) { result  in
            switch result {
                case .success(_):
                    XCTAssertTrue(false)
                case .failure(let error):
                XCTAssertTrue(error as? NetworkError == NetworkError.serverError)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
 
    }
}
