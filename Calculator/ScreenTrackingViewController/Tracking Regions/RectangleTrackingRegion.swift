//
//  RectangleTrackingRegion.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import SceneKit


/// A simple rectangular tracking region with a width and height.
struct RectangleTrackingRegion: TrackingRegion {

    let width: CGFloat
    let height: CGFloat

    func unboundedUnitPosition(for hit: SCNHitTestResult) -> CGPoint? {
        let localX = CGFloat(hit.localCoordinates.x)
        var localY = CGFloat(hit.localCoordinates.y)

        // flip the y coordinate to match UIKit's coordinate system
        localY = -localY

        let unitX = ((self.width / 2.0) + localX) / self.width
        let unitY = ((self.height / 2.0) + localY) / self.height

        return CGPoint(x: unitX, y: unitY)
    }

}
