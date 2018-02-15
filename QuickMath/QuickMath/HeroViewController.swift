//
//  HeroViewController.swift
//  QuickMath
//
//  Created by Andrey Marshall on 2/16/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit

class HeroViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var attributeLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    
    var hero:HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = hero?.localized_name
        attributeLbl.text = hero?.primary_attr
        attackLbl.text = hero?.attack_type
        
        let urlString = "https://api.opendota.com"+(hero?.img)!
        let url = URL(string: urlString)
        
        imageView.downloadedFrom(url: url!)
    }


}
