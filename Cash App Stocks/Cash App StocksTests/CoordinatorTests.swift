//
//  CoordinatorTests.swift
//  Cash App StocksTests
//
//  Created by Mingjun Lei on 8/4/22.
//

import XCTest
@testable import Cash_App_Stocks

class CoordinatorTests: XCTestCase {

    func testInit() throws {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let ac = AppCoordinator(window: window)
        
        XCTAssertNotNil(window.rootViewController as? UINavigationController)
        XCTAssertEqual(ac.navigationController.children.count, 0)
    }

    func testStart() throws {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let ac = AppCoordinator(window: window)
        XCTAssertEqual(ac.navigationController.children.count, 0)
        
        ac.start()
        XCTAssertEqual(ac.navigationController.children.count, 1)
        
        let stocksListCoordinator = ac.children.first
        XCTAssertNotNil(stocksListCoordinator as? StocksListCoordinator)
        
        (stocksListCoordinator as? StocksListCoordinator)?.start()
        XCTAssertEqual(ac.navigationController.children.count, 1)
    }

}
