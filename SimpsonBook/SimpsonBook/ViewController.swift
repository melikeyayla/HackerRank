//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Melike Yayla on 9.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    
    var chosenSimpson : Simpson?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpson Object
        
        let homer = Simpson(simpsonName:"Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: UIImage(named: "HomerSimpson")!)
   
        let bart = Simpson(simpsonName:"Bart Simpson", simpsonJob: "Student", simpsonImage: UIImage(named: "BartSimpson")!)
        
        let marge = Simpson(simpsonName:"Marge Simpson", simpsonJob: "House Wife", simpsonImage: UIImage(named: "MargeSimpson")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        }

    
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

