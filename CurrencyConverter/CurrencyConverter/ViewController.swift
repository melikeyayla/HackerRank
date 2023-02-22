//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Melike Yayla on 22.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jbyLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        
        
        // 1- Request & Session
        // 2- Responce & Data
        // 3- Parsing & JSON Serialization
        
        //1.
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        let session = URLSession.shared
        
        //Closure
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else{
                
                //2.
                
                if data != nil {
                    
                    do{
                        
                        
                        let jsonResponse = try   JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                                     
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                //print(rates)
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jbyLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(turkish)"
                                }
                                
                                
                                
                            }
                        }
                        
                    } catch{
                        print("error")
                    }
                    
                }
                
                
            }
        }
        task.resume()
    }
}

