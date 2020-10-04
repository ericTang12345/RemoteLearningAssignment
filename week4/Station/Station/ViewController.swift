//
//  ViewController.swift
//  Station
//
//  Created by 唐紹桓 on 2020/10/3.
//  Copyright © 2020 唐紹桓. All rights reserved.
//

import UIKit

struct StationData: Decodable {
    var stationID: String
    var stationName: String
    var stationAddress: String
}


class ViewController: UIViewController, URLSessionDelegate {

    @IBOutlet weak var stationIdLabel: UILabel!
    @IBOutlet weak var stationNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let apiURL = "https://stations-98a59.firebaseio.com/practice.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: apiURL) else {
            print("url is nil")
            return
        }
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) {
                (data ,reponse , error) in
                guard error == nil else {
                    print(error.debugDescription)
                    return
                }
                
                guard let data = try? JSONDecoder().decode(StationData.self, from: data!) else {
                    print("data is nil")
                    return
                }
            
                DispatchQueue.main.async {
                    self.stationIdLabel.text = data.stationID
                    self.stationNameLabel.text = data.stationName
                    self.addressLabel.text = data.stationAddress
                }
            }.resume()
        }
    }
}



