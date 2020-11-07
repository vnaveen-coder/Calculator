//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Naveen on 08/05/20.
//  Copyright © 2020 Naveen. All rights reserved..
//

import Foundation
struct CalculatorLogic {
    var number : Double?
    private var intermediateCalculation : (n1 : Double , calcMethod : String)?
    mutating func setNumber(_ number : Double){
        self.number=number
    }
    mutating func calculate(symbol : String) -> Double? {
        if let n = number{
            switch symbol{
            case "AC" :
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return performNewCalculation(n2 : n)
            default:
                intermediateCalculation = (n1 : n , calcMethod : symbol)
            }
        }
        return nil

    }
          func performNewCalculation(n2 : Double ) -> Double? {
            if let n1 = intermediateCalculation?.n1 , let operation = intermediateCalculation?.calcMethod{
                switch operation {
                case "+":
                    return n1 + n2
                case "-":
                    return n1-n2
                case "×":
                    return n1*n2
                case "÷":
                    return n1/n2
                default:
                    fatalError("match dosent exit")
                }
            }
            return nil
        }
}
