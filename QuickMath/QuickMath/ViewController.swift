//
//  ViewController.swift
//  QuickMath
//
//  Created by Andrew Marshall on 1/15/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    @IBAction func numberPressed(_ sender: UIButton) {
        outputLabel.text = outputLabel.text! + String(sender.tag-1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

