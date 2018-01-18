//
//  ViewController.swift
//  QuickMath
//
//  Created by Andrew Marshall on 1/15/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit

enum Operation:String{
    case Add      = "+"
    case Minus    = "-"
    case Divide   = "/"
    case Multiply = "*"
    case NULL    = "Null"
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
    
///////////////////////////////////////////////////////////////////
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
        if runningNumber == ""{
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
                }
                leftValue = result
                outputLabel.text = result
            }
                currentOperation = operation
        }else{
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
            }
        }
 /////////////////////////////////////////////////////////////////////
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

