//
//  ViewController.swift
//  LightModeApp
//
//  Created by Melike Yayla on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.isOn = false
    }


    @IBAction func valueChanged(_ sender: Any) {
        if mySwitch.isOn == true {
            
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .dark
            
        }else {
            
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .light
            
        }
    }
}

