//
//  ViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 14/04/2022.
//
import CoreLocation
import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var vacciList:[VacciCentre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
        
        addAllAnnotations()
        
    }
    
    func removeAllAnnotations(){
        let allAnnotations = self.mapView.annotations
        self.mapView.removeAnnotations(allAnnotations)
    }
    
    /*func addOneAnnotation(){
        let annotation = MKPointAnnotation()
        annotation.title = vacciList.last?.name
        let latitude = vacciList.last?.gps[0]!
        let longitude = vacciList.last?.gps[1]!
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        self.mapView.addAnnotation(annotation)
    }*/
    
    func addAllAnnotations(){
        var i = 0
        while (i < vacciList.count) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: vacciList[i].gps[0]!, longitude: vacciList[i].gps[1]!)
            annotation.title = vacciList[i].name
            self.mapView.addAnnotation(annotation)
            
            i = i + 1
        }
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let center = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
    }



}

