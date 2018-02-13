//
//  TableViewControll.swift
//  QuickMath
//
//  Created by Andrew Marshall on 2/2/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit
var acceptedResult = ["Historia"]


class TableViewControll: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var resultView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var smth = globalVirebles.dataToPass
        resultView.delegate = self
        resultView.dataSource = self
        acceptedResult.append("\(smth)")
        smth = ""
    }
    
    // Show the navigation bar on other view controllers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acceptedResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = acceptedResult[indexPath.row]
        
        return cell!
    }
    
}

