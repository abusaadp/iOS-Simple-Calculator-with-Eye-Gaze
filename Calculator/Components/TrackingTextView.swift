//
//  TrackingTextView.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

class TrackingTextView: UILabel, TrackableWidget, CircularAnimatable {
    var statelessBorderColor: UIColor? {
        didSet {
            self.layer.borderColor = self.statelessBorderColor?.cgColor
        }
    }
    struct Constants {
        static let animationSpeed = TimeInterval(1.0)
        static let cursorColor = UIColor.black
        static let startingCursorOrigin = CGPoint(x: 8, y: 0)
        static let cursorWidth = CGFloat(2.0)
        static let cursorDefaultHeight = CGFloat(16.0)
        static let cursorAnimationDuration = TimeInterval(0.5)
        static let cursorOffset = CGFloat(2.0)
    }
    var animatableComponent = CircularAnimatableComponent()
    var hoverBorderColor: UIColor?
    var isTrackingEnabled: Bool = true
    var animationSpeed = Constants.animationSpeed
    
    var animationViewColor: UIColor? {
        didSet {
            self.animationView.backgroundColor = self.animationViewColor
        }
    }
    
    var parent: TrackableWidget?
    var gazeableComponent = GazeableTrackingComponent()
    
    var id: Int?
    
    func add(to engine: TrackingEngine) {
        engine.registerView(self)
    }
    
    lazy var animationView: UIView = {
        let view = UIView()
        self.addSubview(view)
        self.sendSubviewToBack(view)
        return view
    }()
    
    lazy var cursor: UIView = {
        let view = UIView()
        view.frame = CGRect(origin: Constants.startingCursorOrigin, size: self.cursorSize)
        self.addSubview(view)
        return view
    }()
    
    var cursorSize: CGSize {
        let width = Constants.cursorWidth
        let height = (self.font?.lineHeight ?? Constants.cursorDefaultHeight) - 4.0
        return CGSize(width: width, height: height)
    }
    
    func runCursor() {
        self.layer.removeAllAnimations()
        cursor.backgroundColor = Constants.cursorColor
        self.cursor.alpha = 1.0
        UIView.animate(withDuration: Constants.cursorAnimationDuration, delay: .zero, options: [.autoreverse, .repeat], animations: {
            self.cursor.alpha = 0.0
        }, completion: nil)
    }
}
