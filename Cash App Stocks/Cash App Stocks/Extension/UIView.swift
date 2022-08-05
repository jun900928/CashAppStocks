//
//  UIView.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import UIKit

enum AutoLayoutSize {
    case height, width
}

enum AutoLayoutEdge {
    case top, bottom, leading, trailing, centerX, centerY, height, width
}

extension UIView {

    @discardableResult
    func constrainToSafeAreaLayoutGuide(edges: AutoLayoutEdge..., spacing: CGFloat) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for edge in edges {
            if let constraint = constrainToSafeAreaLayoutGuide(edge: edge, spacing: spacing) {
                constraints.append(constraint)
            }
        }
        return constraints
    }
    
    /// Directly apply autoLayout edges constraint to its superview base on SafeAreaLayoutGuide.
    /// Enable the contriant right away
    /// - Parameters:
    ///   - edge: AutoLayoutEdge
    ///   - spacing: Space between it's super view
    /// - Returns: NSLayoutConstraint
    @discardableResult
    func constrainToSafeAreaLayoutGuide(edge: AutoLayoutEdge, spacing: CGFloat ) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        var constraint: NSLayoutConstraint?
        
        switch edge {
        case .top:
            constraint = safeAreaLayoutGuide.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: spacing)
        case .bottom:
            constraint = safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -spacing)
        case .leading:
            constraint = safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: spacing)
        case .trailing:
            constraint = safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -spacing)
        case .centerX:
            constraint = safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.centerXAnchor, constant: spacing)
        case .centerY:
            constraint = safeAreaLayoutGuide.centerYAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.centerYAnchor, constant: spacing)
        case .height:
            constraint = safeAreaLayoutGuide.heightAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.heightAnchor, constant: spacing)
        case .width:
            constraint = safeAreaLayoutGuide.widthAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.widthAnchor, constant: spacing)
        }
        
        constraint?.isActive = true
        return constraint
    }
    
    @discardableResult
    func constrainToLayoutMarginsGuide(edges: AutoLayoutEdge..., spacing: CGFloat = 0) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for edge in edges {
            if let constraint = constrainToLayoutMarginsGuide(edge: edge, spacing: spacing) {
                constraints.append(constraint)
            }
        }
        return constraints
    }
    
    /// Directly apply autoLayout edges constraint to its superview.
    /// Enable the contriant right away
    /// - Parameters:
    ///   - edge: AutoLayoutEdge
    ///   - spacing: Space between it's super view
    /// - Returns: NSLayoutConstraint
    @discardableResult
    func constrainToLayoutMarginsGuide(edge: AutoLayoutEdge, spacing: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        var constraint: NSLayoutConstraint?
        
        switch edge {
        case .top:
            constraint = topAnchor.constraint(equalTo: superview.layoutMarginsGuide.topAnchor, constant: spacing)
        case .bottom:
            constraint = bottomAnchor.constraint(equalTo: superview.layoutMarginsGuide.bottomAnchor, constant: -spacing)
        case .leading:
            constraint = leadingAnchor.constraint(equalTo: superview.layoutMarginsGuide.leadingAnchor, constant: spacing)
        case .trailing:
            constraint = trailingAnchor.constraint(equalTo: superview.layoutMarginsGuide.trailingAnchor, constant: -spacing)
        case .centerX:
            constraint = centerXAnchor.constraint(equalTo: superview.layoutMarginsGuide.centerXAnchor, constant: spacing)
        case .centerY:
            constraint = centerYAnchor.constraint(equalTo: superview.layoutMarginsGuide.centerYAnchor, constant: spacing)
        case .height:
            constraint = heightAnchor.constraint(equalTo: superview.layoutMarginsGuide.heightAnchor, constant: spacing)
        case .width:
            constraint = widthAnchor.constraint(equalTo: superview.layoutMarginsGuide.widthAnchor, constant: spacing)
        }
        
        constraint?.isActive = true
        return constraint
    }
    
    @discardableResult
    func constrainToSuperview(edges: AutoLayoutEdge..., spacing: CGFloat = 0) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        for edge in edges {
            if let constraint = constrainToSuperview(edge: edge, spacing: spacing) {
                constraints.append(constraint)
            }
        }
        return constraints
    }
    
    /// Directly apply autoLayout edges constraint to its superview.
    /// Enable the contriant right away
    /// - Parameters:
    ///   - edge: AutoLayoutEdge
    ///   - spacing: Space between it's super view
    /// - Returns: NSLayoutConstraint
    @discardableResult
    func constrainToSuperview(edge: AutoLayoutEdge, spacing: CGFloat = 0) -> NSLayoutConstraint? {
        guard let superview = self.superview else {
            return nil
        }
        
        var constraint: NSLayoutConstraint?
        
        switch edge {
        case .top:
            constraint = self.topAnchor.constraint(equalTo: superview.topAnchor, constant: spacing)
        case .bottom:
            constraint = self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -spacing)
        case .leading:
            constraint = self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: spacing)
        case .trailing:
            constraint = self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -spacing)
        case .centerX:
            constraint = self.centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: spacing)
        case .centerY:
            constraint = self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: spacing)
        case .height:
            constraint = self.heightAnchor.constraint(equalTo: superview.heightAnchor, constant: spacing)
        case .width:
            constraint = self.widthAnchor.constraint(equalTo: superview.widthAnchor, constant: spacing)
        }
        
        constraint?.isActive = true
        return constraint
    }
    
    /// Convenient methord to apply layout margins with its superview (.top, .bottom, .leading, .trailing)
    /// Enable the contriant right away
    /// - Parameter spacing: Space between it's super view
    func constrainToSuperviewLayoutMarginsGuide(_ spacing: CGFloat = 0) {
        constrainToLayoutMarginsGuide(edges: .top, .bottom, .leading, .trailing, spacing: spacing)
    }
    
    @discardableResult
    /// Convenient methord to apply layout margins with its superview (.top, .bottom, .leading, .trailing)
    /// Enable the contriant right away
    /// - Parameters:
    ///   - size: AutoLayoutSize
    ///   - c: Constant value the width/height should be
    /// - Returns: NSLayoutConstraint
    func constrainTo(size: AutoLayoutSize,_ c: CGFloat = 0) -> NSLayoutConstraint? {
        var constraint: NSLayoutConstraint?
        switch size {
        case .height:
            constraint = heightAnchor.constraint(equalToConstant: c)
        case .width:
            constraint = widthAnchor.constraint(equalToConstant: c)
        }
        constraint?.isActive = true
        return constraint
    }
}
