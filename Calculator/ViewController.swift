//
//  ViewController.swift
//  Calculator
//
//  Created by Abu Saad Papa on 21/10/19.
//  Copyright © 2019 Invention Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var performingMath : Bool = false
    var operation = 0
    
    @IBOutlet weak var resultBoard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true  {
            resultBoard.text = String(sender.tag - 1)
            numberOnScreen = Double(resultBoard.text!)!
            performingMath = false
        } else {
            if resultBoard.text == "0" || operation == -1 {
                resultBoard.text = String(sender.tag - 1)
                operation = 0
            } else {
                resultBoard.text = resultBoard.text! + String(sender.tag - 1)
            }
            numberOnScreen = Double(resultBoard.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if resultBoard.text != "" && sender.tag != 11 && sender.tag != 16 {
            previousNumber = Double(resultBoard.text!)!
            
            if sender.tag == 12 { //Divide
                resultBoard.text = "/"
            }
            
            if sender.tag == 13 { //Multiply
                resultBoard.text = "x"
            }
            
            if sender.tag == 14 { //Subtract
                resultBoard.text = "-"
            }
            
            if sender.tag == 15 { //Add
                resultBoard.text = "+"
            }
            
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 16 {
            if operation == 12 { //Divide
                resultBoard.text = String(previousNumber / numberOnScreen)
            }
            
            if operation == 13 { //Multiply
                resultBoard.text = String(previousNumber * numberOnScreen)
            }
            
            if operation == 14 { //Subtract
                resultBoard.text = String(previousNumber - numberOnScreen)
            }
            
            if operation == 15 { //Add
                resultBoard.text = String(previousNumber + numberOnScreen)
            }
            operation = -1
        } else if sender.tag == 11 {
            resultBoard.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            performingMath = false
        }
    }
}

