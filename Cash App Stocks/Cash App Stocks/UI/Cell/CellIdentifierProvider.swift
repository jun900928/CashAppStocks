//
//  CellIdentifierProvider.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit
protocol CellIdentifierProvider {
    static var cellID: String { get }
}

/**
 Defines an interface for uniform provision of cell identifiers specifically for UITableView or UICollectionView cells,
 also works for other cells requiring cellIdentifiers.
 */
extension CellIdentifierProvider where Self: UIView {
    
    static var cellID: String {
        return String(describing: Self.self)
    }
}
