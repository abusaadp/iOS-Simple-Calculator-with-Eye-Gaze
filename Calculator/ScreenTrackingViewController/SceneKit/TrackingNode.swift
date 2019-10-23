//
//  TrackingNode.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import ARKit

class TrackingNode: SCNNode {

    // MARK: - Configuration

    var trackingConfiguration: TrackingConfiguration

    private var trackingMethod: TrackingMethod { return self.trackingConfiguration.trackingMethod }
    private var trackingRegion: TrackingRegion { return self.trackingConfiguration.trackingRegion }


    // MARK: - Face Tracking

    func track(faceAnchor: ARFaceAnchor) -> TrackingResult? {
        guard let hitTest = trackingMethod.intersect(faceAnchor: faceAnchor, withHitTestNode: self) else {
            return nil 
        }

        guard let unitPosition = trackingRegion.unitPosition(for: hitTest) else {
            return nil
        }

        return TrackingResult(hitTest: hitTest, unitPositionInPlane: unitPosition)
    }


    // MARK: -

    init(trackingConfiguration config: TrackingConfiguration) {
        self.trackingConfiguration = config

        super.init()

        self.geometry = self.hitTestPlane
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }


    // MARK: -

    private let hitTestPlane: SCNPlane = {
        let plane = SCNPlane(width: 100.0, height: 100.0) // psuedo-infinite plane
        plane.materials.first?.diffuse.contents = UIColor.white
        plane.materials.first?.transparency = 0.3
        plane.materials.first?.isDoubleSided = true
        return plane
    }()

}
