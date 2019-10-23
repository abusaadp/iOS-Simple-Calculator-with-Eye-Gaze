//
//  Bounded.swift
//  Calculator
//
//  Created by Abu Saad Papa on 21/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

protocol Boundable where Value: Comparable {
    associatedtype Value
    func bounded(by bounds: ClosedRange<Value>) -> Self
}

extension Comparable {

    func bounded(by bounds: ClosedRange<Self>) -> Self {
        return min(bounds.upperBound, max(bounds.lowerBound, self))
    }

}

extension CGPoint: Boundable {
    typealias Value = CGFloat

    func bounded(by bounds: ClosedRange<CGFloat>) -> CGPoint {
        return CGPoint(x: self.x.bounded(by: bounds), y: self.y.bounded(by: bounds))
    }

}
