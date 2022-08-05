//
//  UIAlertController.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/4/22.
//
import UIKit
extension UIViewController {
    func showToast(message : String) {
        let textView = ToastView()
        textView.text = message
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.constrainToLayoutMarginsGuide(edges: .centerX)
        textView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: .sepearateSpaceBefore).isActive = true
        textView.leadingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        UIView.animate(withDuration: 0.4, delay: 5, options: .curveEaseOut, animations: {
            textView.alpha = 0.0
        }, completion: {(isCompleted) in
            textView.removeFromSuperview()
        })
    }
}
