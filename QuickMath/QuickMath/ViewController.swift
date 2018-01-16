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
    
    @IBOutlet weak var warningLabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
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
    }
    
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
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
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
                        warningLabel.text = "you can't divide by 0"
                        result = ""
                        runningNumber = ""
                        leftValue = "0"
                        currentOperation = .NULL
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

