//
//  TrackingMethod.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import ARKit

protocol TrackingMethod {

    /// Returns the best result, if any, of intersecting a face anchor with a hit test plane.
    ///
    /// The faceAnchor and hitTestPlane must originate from the same scene.
    func intersect(faceAnchor: ARFaceAnchor, withHitTestNode hitTestNode: SCNNode) -> SCNHitTestResult?

}

struct TrackingResult {
    let hitTest: SCNHitTestResult
    let unitPositionInPlane: CGPoint
}

struct WorldTrackingResult {
    let worldCoordinates: SCNVector3
    let unitPositionInPlane: CGPoint
}
