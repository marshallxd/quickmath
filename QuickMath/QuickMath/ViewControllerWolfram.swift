//
//  ViewControllerWolfram.swift
//  QuickMath
//
//  Created by Andrew Marshall on 1/26/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerWolfram: UIViewController {
    
    
    @IBOutlet weak var weblol: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://github.com/marshallxd/quickmath/blob/master/README.md")
        let request = URLRequest(url: url!)
        
        weblol.load(request)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
