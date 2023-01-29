//
//  ViewController.swift
//  TravelBook
//
//  Created by Melike Yayla on 29.01.2023.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var chosenLatitude = Double()
    var chosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedTitleId : UUID?
    
    var annotationTitle = ""
    var annotationSubtitle = ""
    var annotationLatitude = Double()
    var annotationLongitude = Double()
    
                override func viewDidLoad() {
                    super.viewDidLoad()
                    
                    mapView.delegate = self
                    locationManager.delegate = self
                    locationManager.desiredAccuracy = kCLLocationAccuracyBest
                    locationManager.requestWhenInUseAuthorization()
                    locationManager.startUpdatingLocation()
                    
                    let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer: )))
                    
                    gestureRecognizer.minimumPressDuration = 3
                    mapView.addGestureRecognizer(gestureRecognizer)
        
        
        if selectedTitle != ""{
            //coredata
           
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            let idString = selectedTitleId!.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString)
            fetchRequest.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(fetchRequest)
                if results.count > 0 {
                    for result in results as! [NSManagedObject]{
                        
                        if let title = result.value(forKey: "title") as? String{
                            annotationTitle = title
                            
                                if let subtitle = result.value(forKey: "subtitle") as? String{
                                annotationSubtitle = subtitle
                                    
                                        if let latitude = result.value(forKey: "latitude") as? Double {
                                        annotationLatitude = latitude
                                            
                                                if let longitude = result.value(forKey: "longitude") as? Double {
                                               annotationLongitude = longitude
                                                    
                                                    let annotation = MKPointAnnotation()
                                                    annotation.title = annotationTitle
                                                    annotation.subtitle = annotationSubtitle
                                                    let coordinate = CLLocationCoordinate2D(latitude: annotationLatitude, longitude: annotationLongitude)
                                                    annotation.coordinate = coordinate
                                                    
                                                    mapView.addAnnotation(annotation)
                                                    nameText.text = annotationTitle
                                                    commentText.text = annotationSubtitle
                                                    
                                                    locationManager.stopUpdatingLocation()
                                                    
                                                    
                                            }
                                            
                                    }
                                    
                            }
                            
                        }
 
                    }
                }
            } catch {
                print("error")
            }
            
        }else{
            //add new data
        }
    }
    
    
    //AddPin
    @objc func chooseLocation(gestureRecognizer: UILongPressGestureRecognizer){
        
        if gestureRecognizer.state == .began {
            
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinates = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            chosenLatitude = touchedCoordinates.latitude
            chosenLongitude = touchedCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinates
            annotation.title = nameText.text
            annotation.subtitle = commentText.text
            self.mapView.addAnnotation(annotation)
            
        }
    }
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.latitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
    }

    //coredata
    @IBAction func saveButton(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Places", into: context)
        newPlace.setValue(nameText.text, forKey: "title")
        newPlace.setValue(commentText.text, forKey: "subtitle")
        newPlace.setValue(chosenLatitude, forKey: "latitude")
        newPlace.setValue(chosenLongitude, forKey: "longitude")
        newPlace.setValue(UUID(), forKey: "id")
        
        do {
            try context.save()
            print("success")
        }catch {
            print("error")
        }
        
        
    }
    
}

