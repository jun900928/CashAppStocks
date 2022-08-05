//
//  AppCoordinator.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit
class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    var children = [Coordinator]()

    init(window: UIWindow?) {
        navigationController = UINavigationController()
        window?.rootViewController = navigationController
    }

    func start() {
        let stocksListCoordinator = StocksListCoordinator.init(navigationController: navigationController)
        addChild(stocksListCoordinator)
        stocksListCoordinator.start()
    }
}
