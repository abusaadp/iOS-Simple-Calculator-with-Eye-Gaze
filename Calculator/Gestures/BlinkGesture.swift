//
//  BlinkGesture.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation
import ARKit

class BlinkGesture: FaceGesture {
    private var gestureType: ARFaceAnchor.BlendShapeLocation
    private var eyeState: EyeState = .open
    
    init(gestureType: ARFaceAnchor.BlendShapeLocation, requiredGestures: Int) {
        self.gestureType = gestureType
        super.init()
        self.requiredGestures = requiredGestures
    }
    
    override func prepare(withAnchor anchor: ARFaceAnchor) {
        self.isGestureDetected = false
        if let value = anchor.blendShapes[gestureType] {
            let didUpdate = self.eyeState.update(value: value)
            self.isGestureDetected = didUpdate && self.eyeState == .open
        }
    }
}
