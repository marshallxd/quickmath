//
//  ViewController.swift
//  QuickMath
//
//  Created by Andrew Marshall on 1/9/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

class CustomButton : UIButton{
    @IBInspectable var adjustsTitleFontSizeToFitWidth: Bool = false {
        didSet {
            self.titleLabel?.adjustsFontSizeToFitWidth = adjustsTitleFontSizeToFitWidth
        }
    }
}
