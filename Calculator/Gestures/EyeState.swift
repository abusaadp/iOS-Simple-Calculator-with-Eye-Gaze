//
//  EyeState.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation

enum EyeState {
    case closed
    case open
    
    static let closedThreshold = NSNumber(0.5)
    
    mutating func update(value: NSNumber) -> Bool {
        if value.floatValue > EyeState.closedThreshold.floatValue && self == .open {
            self = .closed
            return true
        } else if value.floatValue <= EyeState.closedThreshold.floatValue && self == .closed {
            self = .open
            return true
        }
        return false
    }
}
