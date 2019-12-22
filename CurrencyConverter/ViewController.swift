//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Marcus Vinicius Galdino Medeiros on 21/12/19.
//  Copyright © 2019 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var brlLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func getRates(_ sender: Any) {
        
        // 1 - Request & Session
        // 2 - Response e Data
        // 3 - Parsing & JSON Serialization
        
        //1
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=d4bd644da127ef8dee9cedb8295ee64d")
        
        let session = URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                // 2
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        // ASYNC
                        DispatchQueue.main.async {
                            print(jsonResponse)
                        }
                        
                    }catch{
                        print("error")
                    }
                   
                }
            }
        }
        task.resume()
    
    }
    

}

