//
//  TrackableWidget.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

struct GazeableTrackingComponent {
    fileprivate var _onGaze: ((Int?) -> Void)?
}

protocol TrackableWidget: Gazeable {
    var parent: TrackableWidget? { get set }
    var id: Int? { get set }
    var gazeableComponent: GazeableTrackingComponent { get set }
    var isTrackingEnabled: Bool { get set }
    func add(to engine: TrackingEngine)
}

extension TrackableWidget {
    var onGaze: ((Int?) -> Void)? {
        get {
            guard let componentOnGaze = self.gazeableComponent._onGaze else { return self.parent?.onGaze }
            return componentOnGaze
        }
        set {
            self.gazeableComponent._onGaze = newValue
        }
    }
}
