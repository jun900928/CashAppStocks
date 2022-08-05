//
//  Coordinators.swift
//  Cash App Stocks
//
//  Created by Mingjun Lei on 8/3/22.
//

import Foundation

public protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
}

public extension Coordinator {
    
    /// Add a new Coordinator as subflow for the parrent coordinator
    /// - Parameter child: Coordinator
    func addChild(_ child: Coordinator) {
        children.append(child)
    }
    
    /// Remove child coordinator to the parrent coordinator
    /// So that the navigation flow will be removed
    /// - Parameter child: Coordinator
    func removeChild(_ child: Coordinator) {
        children = children.filter { $0 !== child }
    }
    
}
