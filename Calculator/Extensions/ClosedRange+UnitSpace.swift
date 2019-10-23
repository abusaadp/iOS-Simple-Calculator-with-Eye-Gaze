//
//  ClosedRange+UnitSpace.swift
//  Calculator
//
//  Created by Abu Saad Papa on 21/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

extension ClosedRange where Bound == Int {

    static var unitRange: ClosedRange {
        return 0...1
    }

}

extension ClosedRange where Bound == Float {

    static var unitRange: ClosedRange {
        return 0.0...1.0
    }

}

extension ClosedRange where Bound == Double {

    static var unitRange: ClosedRange {
        return 0.0...1.0
    }

}

extension ClosedRange where Bound == CGFloat {

    static var unitRange: ClosedRange {
        return 0.0...1.0
    }

}
