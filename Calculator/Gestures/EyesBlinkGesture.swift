//
//  EyesBlinkGesture.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation
import ARKit

class EyesBlinkGesture: FaceGesture {
    private var leftEyeState: EyeState = .open
    private var rightEyeState: EyeState = .open
    
    init(requiredGestures: Int) {
        super.init()
        self.requiredGestures = requiredGestures
    }
    
    override func prepare(withAnchor anchor: ARFaceAnchor) {
        self.isGestureDetected = false
        if let leftEye = anchor.blendShapes[.eyeBlinkLeft], let rightEye = anchor.blendShapes[.eyeBlinkRight] {
            let didUpdateLeft = self.leftEyeState.update(value: leftEye)
            let didUpdateRight = self.rightEyeState.update(value: rightEye)
            self.isGestureDetected = didUpdateLeft && didUpdateRight && self.leftEyeState == .open && self.rightEyeState == .open
        }
    }
}
