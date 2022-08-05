//
//  StocksListCoordinator.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit
class StocksListCoordinator: Coordinator {

    var navigationController: UINavigationController
    var children = [Coordinator]()

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func start() {
        let dataProvider = StocksRemoteDataProvider()
        let vc = StocksListViewController(dataProvider, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    /// Error handling flow
    /// - Parameters:
    ///   - error: Error
    ///   - vc: the UIViewController that occutrs error
    func errorHandling(_ error: Error, on vc: UIViewController) {
        let errorMsg = (error as? NetworkError)?.localizedDescription ?? error.localizedDescription
        if navigationController.topViewController == vc {
            vc.showToast(message: errorMsg)
        }
    }
}
