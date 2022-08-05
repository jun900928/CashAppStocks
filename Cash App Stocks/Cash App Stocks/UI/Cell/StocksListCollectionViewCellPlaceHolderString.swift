//
//  StocksListCollectionViewCellPlaceHolderString.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

private let defaultLabelDescriptions = ["Ticker", "Name", "currency", "current Price Cents", "Quantity", "Current Price Timestamp"]

struct StocksListCollectionViewCellPlaceHolderString {
    
    private let labelDescriptions: [String]
    
    init(_ labelDescriptions: [String] = defaultLabelDescriptions) {
        self.labelDescriptions = labelDescriptions
    }
    
    func description(_ index: Int) -> String {
        guard index < labelDescriptions.count else {return ""}
        return labelDescriptions[index]
    }
}
