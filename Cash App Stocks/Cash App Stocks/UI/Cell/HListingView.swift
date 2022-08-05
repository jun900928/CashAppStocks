//
//  HListingView.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/4/22.
//

import UIKit
class HListingView: UIView {
    var leftLabelText: String? {
        set {
            leftLabel.text = newValue
        }
        
        get {
            return leftLabel.text
        }
    }
    
    var rightLabelText: String? {
        set {
            rightLabel.text = newValue
        }
        
        get {
            return rightLabel.text
        }
    }

    private lazy var leftLabel: UILabel = {
        return buildLabel(textAlignment: .left)
    }()
    
    private lazy var rightLabel: UILabel = {
        return buildLabel(textAlignment: .right)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI (){
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.borderWidth = .sepearateLineSpace
        for label in [leftLabel, rightLabel] {
            self.addSubview(label)
            label.constrainToLayoutMarginsGuide(edge: .top)
        }
        
        leftLabel.constrainToLayoutMarginsGuide(edges: .leading)
        leftLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: .sepearateSpaceBefore).isActive = true
        layoutMarginsGuide.bottomAnchor.constraint(equalTo: leftLabel.bottomAnchor).isActive = true
        
        rightLabel.constrainToLayoutMarginsGuide(edges: .trailing)
        rightLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: .sepearateSpaceAfter).isActive = true
        layoutMarginsGuide.bottomAnchor.constraint(greaterThanOrEqualTo: rightLabel.bottomAnchor).isActive = true
    }
    
    private func buildLabel(textAlignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = textAlignment
        label.font = UIFont.systemFont(ofSize: .titleFont)
        return label
    }
}

extension HListingView: CalculateSelfHeight {
    func calculateHieght(width: CGFloat) -> CGFloat {
        let widthConstraint = self.constrainTo(size: .width, width)
        let size = self.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        widthConstraint?.isActive = false
        return size.height
    }
}
