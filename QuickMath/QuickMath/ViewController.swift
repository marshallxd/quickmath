//
//  ViewController.swift
//  QuickMath
//
//  Created by Andrew Marshall on 1/15/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit
import WebKit

enum Operation:String{
    case Add        = "+"
    case Minus      = "-"
    case Divide     = "/"
    case Multiply   = "*"
    case NULL       = "Null"
    case Percentege = "%"
    case Stepinb    = "xˆy"
    case Sqrt1      = "√x"
    case mod1       = "Mod"
}


class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBOutlet weak var WarningLabel: UILabel!
    
    @IBOutlet weak var mcLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    var memNumber = ""
    var percValue = ""
    var tempValue = 1
    var tempValue2 = ""
    var darkness = 1
    var darkness2 = ""
    
    ///////////////////////////////BUTTONS//////////////////////////////////
    //Number pressed
    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 13 {
            runningNumber += "\(sender.tag-1)"
            outputLabel.text = runningNumber
        }
    }
    
    //Clear button pressed
    @IBAction func clearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLabel.text = "0"
        runningNumber = ""
        WarningLabel.text = ""
        
    }
    // Dot pressed
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 12 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    // Plus(add) +++++
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    //Minus
    @IBAction func minusPressed(_ sender: UIButton) {
        operation(operation: .Minus)
    }
    //Multiply
    @IBAction func multiplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    //Divide
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    //Equal
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    //Remove last
    @IBAction func dropLastChar(_ sender: UIButton) {
        if runningNumber == "" {
            outputLabel.text = "0"
            runningNumber = ""
        } else {
            runningNumber = String(runningNumber.dropLast())
            outputLabel.text = runningNumber
        }
        
    }
    // Mem Number
    @IBAction func memorisePlus(_ sender: UIButton) {
        mcLabel.text = outputLabel.text
        memNumber = runningNumber
    }
    // Print mem
    @IBAction func printMemorised(_ sender: UIButton) {
        outputLabel.text = mcLabel.text
        runningNumber = memNumber
    }
    // Clean mem
    @IBAction func clearMem(_ sender: UIButton) {
        mcLabel.text = ""
        memNumber = ""
    }
    // Plus/Minus
    @IBAction func plusMinus(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = "\(Double(leftValue)! * (-1))"
        }
        runningNumber = "\(Double(runningNumber)! * (-1))"
        outputLabel.text = runningNumber
    }
    
    @IBAction func percentegePressed(_ sender: UIButton) {
        operation(operation: .Percentege)
    }
    
    @IBAction func piPressed(_ sender: UIButton) {
        runningNumber = "3.141592653589"
        outputLabel.text = runningNumber
    }
    
    @IBAction func logPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else {
        runningNumber = "\(log(Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func sqrtPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else {
        runningNumber = "\(sqrt(Double(runningNumber)!))"
        leftValue = runningNumber
        outputLabel.text = runningNumber
        }
    }
    

    @IBAction func log2Pressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        }else {
        runningNumber = "\(log2(Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func timesX(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else {
        runningNumber = "\(pow(10, Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func stepinbPressed(_ sender: UIButton) {
        operation(operation: .Stepinb)
    }
    
    @IBAction func pow2(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else {
        runningNumber = "\(pow(Double(runningNumber)!,2))"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func functorial(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else {
        runningNumber = "\(factorial(n: Int(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    
    @IBAction func absPressed(_ sender: UIButton) {
        if runningNumber == "" {
        WarningLabel.text = "Enter number"
        } else {
            runningNumber = "\(abs(Int(runningNumber)!))"
            outputLabel.text = runningNumber
        }
    }
    
    
    @IBAction func modPressed(_ sender: UIButton) {
        operation(operation: .mod1)
    }
    
    
    @IBAction func decPressed(_ sender: UIButton) {
        if runningNumber == "" {
           WarningLabel.text = "Enter number"
        } else {
        darkness = Int(runningNumber, radix: 2 )!
        runningNumber = String(darkness)
        outputLabel.text = String(darkness)
        }
    }
    
    
    @IBAction func binPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            darkness2 = String(Int(runningNumber)!, radix: 2)
            runningNumber = darkness2
            outputLabel.text = darkness2
        }
    }
    
    @IBAction func hexPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            darkness = Int(runningNumber, radix: 16 )!
            runningNumber = String(darkness)
            outputLabel.text = String(darkness)
        }
    }
    
    @IBAction func octPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            darkness2 = String(Int(runningNumber)!, radix: 8)
            runningNumber = darkness2
            outputLabel.text = darkness2
        }
    }
    
    @IBAction func sinPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            runningNumber = String(sin(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    
    @IBAction func cosPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            runningNumber = String(cos(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    
    @IBAction func tanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            runningNumber = String(tan(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    
    @IBAction func ctanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            WarningLabel.text = "Enter number"
        } else{
            runningNumber = String((1/tan(Double(runningNumber)!)))
            outputLabel.text = runningNumber
        }
    }
    
    
    ///////////////////////////////////////////////////////////////////////
    // OPERATIONS
    func operation(operation: Operation){
        if currentOperation != .NULL {
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                        result = "\(Int(Double(result)!))"
                    }
                } else if currentOperation == .Minus{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                        result = "\(Int(Double(result)!))"
                    }
                } else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                        result = "\(Int(Double(result)!))"
                    }
                } else if currentOperation == .Divide{
                    if rightValue == "0" {
                        result = "0"
                        runningNumber = ""
                        WarningLabel.text = "Do not divide by zero, pls"
                    } else {
                        result = "\(Double(leftValue)! / Double(rightValue)!)"
                        if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                            result = "\(Int(Double(result)!))"
                        }
                    }
                }else if currentOperation == .Percentege {
                    percValue = "\((Double(leftValue)! * (Double(rightValue)!)/100))"
                    result = percValue
                } else if currentOperation == .Stepinb {
                        result = "\(pow(Double(leftValue)!,Double(rightValue)!))"
                } else if currentOperation == .mod1 {
                    result = "\(Double(leftValue)!.truncatingRemainder(dividingBy: Double(rightValue)!))"
                }
                leftValue = result
                runningNumber = result
                outputLabel.text = result
            }
            currentOperation = operation
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    ////////////////////////////////FUNCTIONS/////////////////////////////
    
    func factorial(n: Int) -> Int {
        if n == 1 {
            return 1
        } else {
            return n * factorial(n: n - 1)
        }
    }
    
    ////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

