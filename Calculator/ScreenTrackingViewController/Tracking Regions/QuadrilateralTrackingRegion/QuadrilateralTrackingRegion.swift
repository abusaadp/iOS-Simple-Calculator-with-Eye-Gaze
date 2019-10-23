//
//  QuadrilateralTrackingRegion.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import SceneKit


struct QuadrilateralTrackingRegion: TrackingRegion {

    private let interpolator: QuadrilateralInterpolator

    init(quad: Quadrilateral) {
        self.interpolator = QuadrilateralInterpolator(quad: quad)
    }

    func unboundedUnitPosition(for hit: SCNHitTestResult) -> CGPoint? {
        return self.interpolator.unitPosition(ofPointInQuad: CGPoint(x: CGFloat(hit.localCoordinates.x),
                                                                     y: CGFloat(hit.localCoordinates.y)))
    }

}
