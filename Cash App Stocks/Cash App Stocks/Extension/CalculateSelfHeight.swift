//
//  CalculateSelfHeight.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit
/// Provide the ability to calculate the height base on target width
protocol CalculateSelfHeight {
    func calculateHieght(width: CGFloat) -> CGFloat
}
