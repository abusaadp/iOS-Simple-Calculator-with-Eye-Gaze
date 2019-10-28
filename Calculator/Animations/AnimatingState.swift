//
//  AnimationHelpers.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation

enum AnimatingState {
    case idle
    case shrinking
    case expanding
    case expanded
    case cancelled
    
    var isGazing: Bool {
        return self == .expanding || self == .expanded
    }
}
