//
//  StocksListViewControllerDataProvider.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

protocol StocksListViewControllerDataProvider {
    var stocksList: [Stock] { get }
}
