//
//  DateFormatter.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation
public extension DateFormatter {
    /// Convert date base on "yyyy-MM-dd HH:mm:ss" format
    /// - Parameter date: Date
    /// - Returns: String
    func formateDataOnCurrentTimeZone(date: Date) -> String {
        dateFormat = "yyyy-MM-dd HH:mm:ss"
        return self.string(from: date)
    }
}
