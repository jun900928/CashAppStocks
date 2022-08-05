//
//  ToastView.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/4/22.
//

import UIKit

class ToastView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI(){
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        textColor = .white
        font = UIFont.systemFont(ofSize: .toastFont)
        textAlignment = .center
        alpha = 1.0
        layer.cornerRadius = 10
        clipsToBounds  =  true
        isScrollEnabled  = false
        isEditable = false
        textContainerInset = UIEdgeInsets(top: .sepearateSpace, left: .sepearateSpace, bottom: .sepearateSpace, right: .sepearateSpace)
    }
}

