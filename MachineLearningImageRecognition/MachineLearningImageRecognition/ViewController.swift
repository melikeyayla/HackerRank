//
//  ViewController.swift
//  MachineLearningImageRecognition
//
//  Created by Melike Yayla on 13.03.2023.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeClicked(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
        
        if let ciImage = CIImage(image: imageView.image!){
            chosenImage = ciImage
        }
        
        recognizerImage(image: chosenImage)
    }
    
    func recognizerImage(image: CIImage) {
        resultLabel.text = "Finding.."
        
        //Request
        //Handler
        
        if let  model = try? VNCoreMLModel(for: MobileNetV2().model) {
            let request = VNCoreMLRequest(model: model) { vnrequest, error in
                
                if let results = vnrequest.results as? [VNClassificationObservation] {
                    
                    if results.count > 0 {
                        
                        let topResult = results.first
                        
                        DispatchQueue.main.async {
                            //Handler
                            let confidenceLevel = (topResult?.confidence ?? 0 ) * 100
                            let rounded = Int (confidenceLevel * 100) / 100
                            
                            self.resultLabel.text = "\(rounded)% it's \(topResult!.identifier)"
                        }
                    }
                    
                }
                
            }
            
            let handler = VNImageRequestHandler(ciImage: image)
            DispatchQueue.global(qos: .userInteractive).async {
                
                do{
                    try handler.perform([request])
                }catch {
                    print("error")
                }
            }
        }
       
    }
}

