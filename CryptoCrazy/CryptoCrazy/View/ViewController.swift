//
//  ViewController.swift
//  CryptoCrazy
//
//  Created by Melike Yayla on 6.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor(red: 20/225, green: 44/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 30/225, green: 55/255, blue: 14/255, alpha: 1.0),
            UIColor(red: 40/225, green: 66/255, blue: 56/255, alpha: 1.0),
            UIColor(red: 50/225, green: 77/255, blue: 789/255, alpha: 1.0),
            UIColor(red: 60/225, green: 88/255, blue: 65/255, alpha: 1.0),
            UIColor(red: 70/225, green: 99/255, blue: 45/255, alpha: 1.0)
        ]
        
        getData()
       
       
    }
    func getData () {
        
        let url = URL ( string : "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        
        Webservice().downloadCurrencies(url: url) { cryptos in
            if let cryptos = cryptos{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(index: indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        
        return cell
    }

}

