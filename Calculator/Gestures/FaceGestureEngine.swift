//
//  FaceGestureEngine.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation
import ARKit

class FaceGestureEngine {
    var gestures: [FaceGesture] = []
    
    func update(withAnchor anchor: ARFaceAnchor) {
        for gesture in gestures {
            gesture.update(withAnchor: anchor)
        }
    }
}
