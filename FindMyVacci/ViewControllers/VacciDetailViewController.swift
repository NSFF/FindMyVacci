//
//  VacciDetailViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 30/04/2022.
//

import UIKit
import CoreLocation
import MapKit

class VacciDetailViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var myImageView: UIImage?
    var myAddress:String?
    var myTitle:String?
    var myPhoneNumber:String?
    var gps:[Double?] = []
    
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        
        navBar.title = myTitle
        addressLabel.text = myAddress
        imageView.image = myImageView
        phoneNumberLabel.text = myPhoneNumber
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
        let annotation = MKPointAnnotation()
        annotation.title = myTitle
        annotation.coordinate = CLLocationCoordinate2D(latitude: gps[0]!, longitude: gps[1]!)
        self.mapView.addAnnotation(annotation)
        self.mapView.selectAnnotation(annotation, animated: true)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vacciDetailToImageDetailSegue" {
            let controller = segue.destination as! ImageDetailViewController
            controller.newImage = imageView.image
        }
    }
    
    @IBAction func unwindToVacciDetailViewController(_ segue: UIStoryboardSegue){
        // placeholder to unwind
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let center = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
