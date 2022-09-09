//
//  CalcService.swift
//  Calculator
//
//  Created by Олег Семёнов on 09.09.2022.
//

import Foundation

var isRunning = true
var currentNumber = "0"
var firstNumber = 0.0
var secondNumber = 0.0
var result = ""
var currentOperation = Operations.noAction

func updateDisplay(text: String) {
    print(text)
}

func makeCalculation(operation: Operations) {
    if currentOperation != .noAction {
        if currentNumber != "" {
            secondNumber = Double(currentNumber) ?? 0.0
            switch operation {
            case .addition:
                result = String(firstNumber + secondNumber)
            case .substruction:
                result = String(firstNumber - secondNumber)
            case .multiplication:
                result = String(firstNumber * secondNumber)
            case .division:
                result = String(firstNumber / secondNumber)
            default:
                break
            }
        }
    } else {
        firstNumber = Double(currentNumber) ?? 0.0
        currentNumber = ""
        updateDisplay(text: currentNumber)
        currentOperation = operation
    }
}

