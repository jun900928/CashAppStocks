//
//  StocksListCollectionViewCellDataModel.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation
protocol CollectionViewCellDataModel {
    var title: String { get }
    
    var subtitle: String { get }
    
    var detail1: String { get }
    
    var detail2: String { get }
    
    var description1: String? { get }
    
    var description2: String { get }
}

struct StocksListCollectionViewCellDataModel: CollectionViewCellDataModel {
    var title: String {
        return stock.ticker
    }
    
    var subtitle: String {
        return stock.name
    }
    
    var detail1: String {
        return stock.currency
    }
    
    var detail2: String {
        return "\(stock.currentPriceCents)"
    }
    
    var description1: String? {
        if let num = stock.quantity {
            return "\(num)"
        }else {
            return ""
        }
    }
    
    var description2: String {
        let epochTime = TimeInterval(stock.currentPriceTimestamp) / 1000
        let date = Date(timeIntervalSince1970: epochTime)
        return DateFormatter().formateDataOnCurrentTimeZone(date: date)
    }
    
    let stock: Stock
}
