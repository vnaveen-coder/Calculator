//
//  ViewController.swift
//  Calculator
//
//  Created by Naveen on 08/05/20.
//  Copyright © 2020 Naveen. All rights reserved..
//

import UIKit

class ViewController: UIViewController {
    var isFinishedTypingNumber : Bool=true
    private var displayValue : Double{
        get {
            guard  let number=Double(displayLabel.text!) else{
                fatalError("can't convert number to string")
            }
            return number
        }
        set{
            displayLabel.text=String(newValue)
        }
        
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private  var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber=true
        if let calcMethod=sender.currentTitle{
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue=result
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue=sender.currentTitle{
            if isFinishedTypingNumber{
                displayLabel.text=numValue
                isFinishedTypingNumber=false
            }else{
                if numValue=="."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                    
                }
                displayLabel.text=displayLabel.text! + numValue
            }
            
            
        }
    }
    
}

