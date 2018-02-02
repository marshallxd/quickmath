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
struct globalVirebles{
    static var dataToPass = ""
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var WarningLabel: UILabel!
    
    @IBOutlet weak var mcLabel: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    ///////////////MENU//////////////////////////////////////////////
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var sideView: UIView!
    
    
    //////////////////////////////////////////////////////////////////
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    var memNumber = ""
    var percValue = ""
    var tempValue = 1
    var tempValue2 = ""
    
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
        if (outputLabel.text?.count == 0){
            outputLabel.text = "0."
            runningNumber = "0."
        }
        else{
            if outputLabel.text!.range(of: ".") == nil{
                outputLabel.text = outputLabel.text! + "."
                runningNumber += "."
            }
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
    @IBAction func backspace(_ sender: UIButton) {
        if (outputLabel.text?.count == 1){
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
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(Double(runningNumber)! * (-1))"
            }
        }
        runningNumber = "\(Double(runningNumber)! * (-1))"
        outputLabel.text = runningNumber
    }
    //Percentege
    @IBAction func percentegePressed(_ sender: UIButton) {
        operation(operation: .Percentege)
    }
    // Pi
    @IBAction func piPressed(_ sender: UIButton) {
        runningNumber = "3.141592653589"
        outputLabel.text = runningNumber
    }
    // ln
    @IBAction func logPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(log(Double(runningNumber)!))"
                outputLabel.text = runningNumber
            }
        } else {
        runningNumber = "\(log(Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    //sqrt
    @IBAction func sqrtPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                outputLabel.text = runningNumber
                runningNumber = "\(sqrt(Double(runningNumber)!))"
            }
        } else {
        runningNumber = "\(sqrt(Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    //log
    @IBAction func log2Pressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(log2(Double(runningNumber)!))"
                outputLabel.text = runningNumber
            }
        }else {
        runningNumber = "\(log2(Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    // 10ˆx
    @IBAction func timesX(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(pow(10, Double(runningNumber)!))"
                outputLabel.text = runningNumber
            }
        } else {
        runningNumber = "\(pow(10, Double(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    // yˆx
    @IBAction func stepinbPressed(_ sender: UIButton) {
        operation(operation: .Stepinb)
    }
    //xˆ2
    @IBAction func pow2(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(pow(Double(runningNumber)!,2))"
                outputLabel.text = runningNumber
            }
        } else {
        runningNumber = "\(pow(Double(runningNumber)!,2))"
        outputLabel.text = runningNumber
        }
    }
    // factorial
    @IBAction func functorial(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(factorial(n: Int(runningNumber)!))"
                outputLabel.text = runningNumber
            }
        } else {
        runningNumber = "\(factorial(n: Int(runningNumber)!))"
        outputLabel.text = runningNumber
        }
    }
    //abs
    @IBAction func absPressed(_ sender: UIButton) {
        if runningNumber == "" {
        runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = "\(abs(Double(runningNumber)!))"
                outputLabel.text = runningNumber
                
            }
        } else {
            runningNumber = "\(abs(Double(runningNumber)!))"
            outputLabel.text = runningNumber
        }
    }
    //mod
    @IBAction func modPressed(_ sender: UIButton) {
        operation(operation: .mod1)
    }
 
    
    ///////////////////////////////trigonometric functions (in rad)/////////////////
    //asin
    @IBAction func asinPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = String(asin(Double(runningNumber)!))
                outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String(asin(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    //acos
    @IBAction func acos(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = String(Darwin.acos(Double(runningNumber)!))
                outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String(Darwin.acos(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    //atan
    @IBAction func atanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = String(atan(Double(runningNumber)!))
                outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String(atan(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    //actan
    @IBAction func actanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                runningNumber = String((atan(1/(Double(runningNumber)!))))
                outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String((atan(1/(Double(runningNumber)!))))
            outputLabel.text = runningNumber
        }
    }
    //sinus
    @IBAction func sinPressed(_ sender: UIButton) {
        if runningNumber == ""{
           runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                    runningNumber = String(sin(Double(runningNumber)!))
                    outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String(sin(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    //cosinus
    @IBAction func cosPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                    runningNumber = String(cos(Double(runningNumber)!))
                    outputLabel.text = runningNumber
                
            }
        } else{
            runningNumber = String(cos(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    
    //tan
    @IBAction func tanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                    runningNumber = String(tan(Double(runningNumber)!))
                    outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String(tan(Double(runningNumber)!))
            outputLabel.text = runningNumber
        }
    }
    //ctan
    @IBAction func ctanPressed(_ sender: UIButton) {
        if runningNumber == ""{
            runningNumber = leftValue
            if runningNumber == ""{
                WarningLabel.text = "Enter number"
            } else {
                    runningNumber = String((1/atan(Double(runningNumber)!)))
                    outputLabel.text = runningNumber
            }
        } else{
            runningNumber = String((1/atan(Double(runningNumber)!)))
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
                    result = removeZeroFromEnd(n: Double(result)!)
                    currentOperation = .NULL
                } else if currentOperation == .Minus{
                    if leftValue == ""{
                        result = "\(0 - Double(rightValue)!)"
                    } else {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                    result = removeZeroFromEnd(n: Double(result)!)
                }
                    currentOperation = .NULL
                } else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                    result = removeZeroFromEnd(n: Double(result)!)
                    currentOperation = .NULL
                } else if currentOperation == .Divide{
                    if rightValue == "0" {
                        result = "0"
                        runningNumber = ""
                        WarningLabel.text = "Do not divide by zero, pls"
                        currentOperation = .NULL
                    } else {
                        result = "\(Double(leftValue)! / Double(rightValue)!)"
                        result = removeZeroFromEnd(n: Double(result)!)
                    }
                    currentOperation = .NULL
                }else if currentOperation == .Percentege {
                    percValue = "\((Double(leftValue)! * (Double(rightValue)!)/100))"
                    result = percValue
                } else if currentOperation == .Stepinb {
                        result = "\(pow(Double(leftValue)!,Double(rightValue)!))"
                        result = removeZeroFromEnd(n: Double(result)!)
                    currentOperation = .NULL
                } else if currentOperation == .mod1 {
                    result = "\(Double(leftValue)!.truncatingRemainder(dividingBy: Double(rightValue)!))"
                    result = removeZeroFromEnd(n: Double(result)!)
                    currentOperation = .NULL
                }
                globalVirebles.dataToPass = ""
                globalVirebles.dataToPass += "\(result)"
                leftValue = result
                outputLabel.text = result
            }
            currentOperation = operation
            globalVirebles.dataToPass = ""
            globalVirebles.dataToPass += "\(result)"
        }else{
            leftValue = runningNumber
            globalVirebles.dataToPass = ""
            globalVirebles.dataToPass += "\(result)"
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
    
    func removeZeroFromEnd(n: Double) -> String {
        if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
            result = "\(Int(Double(result)!))"
        }
        return result
    }
    
    
    ////////////////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 1
        sideView.layer.shadowOffset = CGSize (width: 5, height: 0)
        
        viewConstraint.constant = -175
        
        globalVirebles.dataToPass = ""
        outputLabel.text = "0"
        runningNumber = ""
    }
    
    @IBAction func penPerform(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let tranlation = sender.translation(in: self.view).x
            
            if tranlation > 0 {  // swipe right
                
                if viewConstraint.constant < 20{
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += tranlation / 10
                        self.view.layoutIfNeeded()
                    })
                }
                
            } else { // swipe left
                if viewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += tranlation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended {
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstraint.constant = -175
                    self.view.layoutIfNeeded()
                })
                
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.viewConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

