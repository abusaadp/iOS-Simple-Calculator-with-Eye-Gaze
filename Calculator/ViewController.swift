//
//  ViewController.swift
//  Calculator
//
//  Created by Abu Saad Papa on 21/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScreenTrackingViewControllerDelegate {
    
    func didGestureForCalibration() {
        // do stuff
    }
    
    func didFinishCalibrationGesture() {
        // do stuff
    }
    
    var trackingConfiguration: TrackingConfiguration = .headTracking {
        didSet {
            self.configureUI()
        }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            
        }
    }


    // MARK: - Demo Interface

    @IBOutlet var buttonStackView: UIView!
    
    var animatorsForButtons: [UIButton: UIViewPropertyAnimator] = [:]

    func configureUI() {
        guard self.isViewLoaded else { return }

        self.screenTrackingViewController.trackingConfiguration = self.trackingConfiguration
    }


    // MARK: - View Lifecycle

    let trackingView: UIView = UIView()
    lazy var screenTrackingViewController: ScreenTrackingViewController = {
        let vc = ScreenTrackingViewController()
        vc.delegate = self
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.screenTrackingViewController.willMove(toParent: self)
        self.screenTrackingViewController.view.frame = self.view.bounds
        self.screenTrackingViewController.view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        self.view.addSubview(self.screenTrackingViewController.view)
        self.addChild(self.screenTrackingViewController)
        self.screenTrackingViewController.didMove(toParent: self)

        self.view.bringSubviewToFront(self.buttonStackView)

        trackingView.frame = CGRect(x: 0.0, y: 0.0, width: 40, height: 40)
        trackingView.layer.cornerRadius = 20.0
        trackingView.backgroundColor = UIColor.purple.withAlphaComponent(0.8)
        self.view.addSubview(trackingView)

        self.configureUI()
        
        self.performSegue(withIdentifier: "showCalculator", sender: nil)
    }


    // MARK: - ScreenTrackingViewControllerDelegate

    func didUpdateTrackedPosition(_ trackedPositionOnScreen: CGPoint?, for screenTrackingViewController: ScreenTrackingViewController) {
        DispatchQueue.main.async {
            if let position = trackedPositionOnScreen {
                self.trackingView.isHidden = false
                self.trackingView.center = position
            } else {
                self.trackingView.isHidden = true
            }
        }
    }
}

