//
//  TrackingView.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

typealias TrackingView = UIView & TrackableWidget

protocol Gazeable: AnyObject {
    var onGaze: ((Int?) -> Void)? { get set }
    var animationSpeed: TimeInterval { get set }
    func animateGaze()
    func cancelAnimation()
}
