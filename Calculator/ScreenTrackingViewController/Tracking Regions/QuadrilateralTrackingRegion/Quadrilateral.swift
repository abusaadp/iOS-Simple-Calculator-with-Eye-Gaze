//
//  Quadrilateral.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit


struct Quadrilateral {
    let p1: CGPoint
    let p2: CGPoint
    let p3: CGPoint
    let p4: CGPoint

    var points: [CGPoint] {
        return [p1, p2, p3, p4]
    }

}
