//
//  ScreenTrackingViewControllerDelegate.swift
//  Calculator
//
//  Created by Abu Saad Papa on 23/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

protocol ScreenTrackingViewControllerDelegate: AnyObject {
    func didUpdateTrackedPosition(_ trackedPositionOnScreen: CGPoint?, for screenTrackingViewController: ScreenTrackingViewController)
    func didGestureForCalibration()
    func didFinishCalibrationGesture()
}
