//
//  ViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 14/04/2022.
//
import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // Reference to the managed object context (= the core data container)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    // Data for the TableView
    var items:[VaccinationCentre]?
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // tableView.dataSource = self
        // tableView.delegate = self
        
        fetchVacci()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        var coordinate = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        var region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
    
    
    func fetchVacci(){
        // Fetch data from core data to display in Table View
        do{
            self.items = try context.fetch(VaccinationCentre.fetchRequest())
            
            DispatchQueue.main.async {
                //tableView.reloadData()
            }
        }
        catch{
            
        }
        
    }



}

