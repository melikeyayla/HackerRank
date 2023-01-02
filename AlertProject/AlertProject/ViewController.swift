//
//  ViewController.swift
//  AlertProject
//
//  Created by Melike Yayla on 1.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func alertSystem(titleInput: String, messageInput:String) {
        
        let alert = UIAlertController(title: titleInput , message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
    }


    @IBAction func signupClicked(_ sender: Any) {
        
        if userNameText.text == "" {
            
           alertSystem(titleInput: "Error", messageInput: "Username not found!")
            
        }else if passwordText.text == "" {
            
            alertSystem(titleInput: "Error", messageInput: "Password not found")
        
        }else if password2Text.text != passwordText.text {
            
            alertSystem(titleInput: "Error", messageInput: "Password do not match")
            
        }else {
            
           alertSystem(titleInput: "Succes!", messageInput: "User OK!")
        }
            
       
       /*
        
        let alert = UIAlertController(title: "ERROR", message: "Username not found", preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
       */
    }
}

