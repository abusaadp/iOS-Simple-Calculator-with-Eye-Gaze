//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Abu Saad Papa on 24/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit
import AVFoundation
import CoreML

class CalculatorViewController: UIViewController, ScreenTrackingViewControllerDelegate {
    func didUpdateTrackedPosition(_ trackedPositionOnScreen: CGPoint?, for screenTrackingViewController: ScreenTrackingViewController) {
        DispatchQueue.main.async {
            if let position = trackedPositionOnScreen {
                self.trackingView.isHidden = false
                let positionInView = self.view.convert(position, from: nil)
                self.trackingView.center = positionInView
                self.trackingEngine.updateWithTrackedPoint(position)
            } else {
                self.trackingView.isHidden = true
            }
        }
    }
    
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
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath : Bool = false
    var operation = 0
    
    let trackingEngine = TrackingEngine()

    // MARK: - Outlets
    @IBOutlet var textfield: TrackingTextView!
    @IBOutlet var numberButtons: [TrackingButton]!
    @IBOutlet var specialButtons: [TrackingButton]!
    @IBOutlet var buttonStackView: UIView!

    private var interactiveViews: [[TrackableWidget]] {
        return [ self.numberButtons,
                 self.specialButtons,
                 [self.textfield]
        ]
    }

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
        
        self.configureInitialState()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let textBoxHeight = self.textfield.frame.height
        textfield.font = UIFont.systemFont(ofSize: textBoxHeight / 2.8)
        self.textfield.runCursor()
    }
    
    private func configureInitialState() {
        self.configureOnGazes()
        
        for views in self.interactiveViews {
            for view in views {
                view.add(to: self.trackingEngine)
            }
        }
    }
    
    func configureOnGazes() {
        for number in numberButtons {
            number.onGaze = { _ in
                self.numbers(number)
            }
        }
        
        for ctrl in specialButtons {
            ctrl.onGaze = { _ in
                self.buttonAction(ctrl)
            }
        }
    }
    
    func numbers(_ sender: TrackingButton) {
        for btn in specialButtons {
            if btn.tag != 11 {
                btn.backgroundColor = UIColor.systemOrange
                btn.setTitleColor(UIColor.white, for: .normal)
            }
        }
        
        if performingMath == true  {
            self.textfield.text = String(sender.tag - 1)
            numberOnScreen = Double(self.textfield.text!)!
            performingMath = false
        } else {
            if self.textfield.text == "0" || operation == -1 {
                self.textfield.text = String(sender.tag - 1)
                operation = 0
            } else {
                self.textfield.text = self.textfield.text! + String(sender.tag - 1)
            }
            numberOnScreen = Double(self.textfield.text!)!
        }
    }
    
    func buttonAction(_ sender: TrackingButton) {
        for btn in specialButtons {
            if btn.tag != 11 {
                btn.backgroundColor = UIColor.systemOrange
                btn.setTitleColor(UIColor.white, for: .normal)
            }
        }
        
        if self.textfield.text != "" && sender.tag != 11 && sender.tag != 16 {
            if operation == 12 { //Divide
                self.textfield.text = String(previousNumber / numberOnScreen)
            }
            
            if operation == 13 { //Multiply
                self.textfield.text = String(previousNumber * numberOnScreen)
            }
            
            if operation == 14 { //Subtract
                self.textfield.text = String(previousNumber - numberOnScreen)
            }
            
            if operation == 15 { //Add
                self.textfield.text = String(previousNumber + numberOnScreen)
            }
            operation = -1
            
            previousNumber = Double(self.textfield.text!)!
            
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.systemOrange, for: .normal)
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 {
            if operation == 12 { //Divide
                self.textfield.text = String(previousNumber / numberOnScreen)
            }
            
            if operation == 13 { //Multiply
                self.textfield.text = String(previousNumber * numberOnScreen)
            }
            
            if operation == 14 { //Subtract
                self.textfield.text = String(previousNumber - numberOnScreen)
            }
            
            if operation == 15 { //Add
                self.textfield.text = String(previousNumber + numberOnScreen)
            }
            operation = -1
        } else if sender.tag == 11 {
            self.textfield.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            performingMath = false
        }
    }
}
