//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Melike Yayla on 11.01.2023.
//

import UIKit

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        //Recognizers
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        
        imageView.isUserInteractionEnabled = true //Kullanıcı görsele tıklayabiliyor mu
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
    }
    
    @objc func selectImage(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary //galeriden seçilecek
        picker.allowsEditing = true // görseli editleyebilir.
        present(picker, animated: true)
        
        
    }
    
    //görseli seçtikten sonra ne yapılacağını anlatıyor
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
    }
    
}
