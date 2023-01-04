//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Melike Yayla on 2.01.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePick))
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePick(){

        imageView.image = UIImage(named: "bts-2")
        myLabel.text = "BTS2"
    }
}
    
