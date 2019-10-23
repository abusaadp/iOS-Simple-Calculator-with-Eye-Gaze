//
//  TrackingConfiguration.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import Foundation


struct TrackingConfiguration {

    let trackingMethod: TrackingMethod
    let trackingRegion: TrackingRegion
    let trackingType: TrackingType

    init(trackingMethod: TrackingMethod, trackingRegion: TrackingRegion, trackingType: TrackingType) {
        self.trackingMethod = trackingMethod
        self.trackingRegion = trackingRegion
        self.trackingType = trackingType
    }

    // MARK: - Default Configurations

    static let headTracking: TrackingConfiguration = {
        return TrackingConfiguration(trackingMethod: HeadDirectionTrackingMethod(), trackingRegion: RectangleTrackingRegion(width: Constants.phoneScreenSize.width, height: Constants.phoneScreenSize.height), trackingType: .head)
    }()

    static let eyeTracking: TrackingConfiguration = {
        return TrackingConfiguration(trackingMethod: LookAtDirectionTrackingMethod(), trackingRegion: RectangleTrackingRegion(width: Constants.phoneScreenSize.width, height: Constants.phoneScreenSize.height), trackingType: .eye)
    }()

}
