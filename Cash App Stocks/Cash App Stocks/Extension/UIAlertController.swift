//
//  UIAlertController.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/4/22.
//
import UIKit

extension UIAlertController {
    //create alert base on alert msg
    static func createAlert(_ error: Error, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let errorMsg = (error as? NetworkError)?.localizedDescription
        let alert = UIAlertController.init(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: handler))
        return alert
    }
}
