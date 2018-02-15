//
//  jsonTestView.swift
//  QuickMath
//
//  Created by Andrey Marshall on 2/15/18.
//  Copyright © 2018 Andrew Marshall. All rights reserved.
//

import UIKit

struct ThreeCitiesWeather: Decodable {
    
    var minsk: City?
    var madrid: City?
    var riga: City?
}

struct City: Decodable {
    var temperature: String
    var weather: String
}

class jsonTestView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "http://swiftbook.ru/json/JSONdata_swift4.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            
            do{
            let threeCitiesWeather = try JSONDecoder().decode(ThreeCitiesWeather.self, from: data)
            print(threeCitiesWeather)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }

}
