//
//  TrackingButton.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

class TrackingButton: UIButton, TrackableWidget, CircularAnimatable {
    var statelessBorderColor: UIColor? {
        didSet {
            self.layer.borderColor = self.statelessBorderColor?.cgColor
        }
    }
    var animatableComponent = CircularAnimatableComponent()
    var hoverBorderColor: UIColor?
    var isTrackingEnabled: Bool = true
    var animationSpeed: TimeInterval = 1.0
    
    var animationViewColor: UIColor? {
        didSet {
            self.animationView.backgroundColor = self.animationViewColor
        }
    }
    
    var id: Int?
    var parent: TrackableWidget?
    var gazeableComponent = GazeableTrackingComponent()
    
    lazy var animationView: UIView = {
        let view = UIView()
        self.addSubview(view)
        self.sendSubviewToBack(view)
        return view
    }()
    
    func add(to engine: TrackingEngine) {
        engine.registerView(self)
    }
}
