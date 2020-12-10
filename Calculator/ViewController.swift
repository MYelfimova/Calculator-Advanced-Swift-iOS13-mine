//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var firstOperand: Double = 0
    private var secondOperand: Double = 0
    private var operatorAction: String = ""
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        // saving the number into a temporary variable
        guard let number = Double(displayLabel.text!) else {
            fatalError("Cannot convert display Label in to a Double.")
        }
        
        if let calcMethod = sender.currentTitle {
        
            switch calcMethod {
            case "+/-":
                displayLabel.text = String(number * -1)
            case "AC":
                displayLabel.text = String("0")
            case "%":
                displayLabel.text =  String(number / 100)
            default:
                return
            }
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

