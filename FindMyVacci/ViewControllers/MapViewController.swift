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
        
        mapView.delegate = self
        
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
    
    func removeOneAnnotation(index:Int){
        // we have to filter user location out of annotations
        let filteredAnnotations = self.mapView.annotations.filter { $0 as! NSObject !== mapView.userLocation
        }
        let annotation = filteredAnnotations[index]
        self.mapView.removeAnnotation(annotation)
    }
    
    /*func addOneAnnotation(){
        let annotation = MKPointAnnotation()
        annotation.title = vacciList.last?.name
        annotation.subtitle = vacciList.last?.municipality
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
            annotation.subtitle = vacciList[i].municipality
            
            self.mapView.addAnnotation(annotation)
            i = i + 1
        }
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let center = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        
        view.canShowCallout = true
        let btn = UIButton(type: .detailDisclosure)
        view.rightCalloutAccessoryView = btn
        
        /* this needs to change, suggested solution: create custom annotation with image within it
         
         */
        // **************************
        /* let tableController = self.tabBarController!.viewControllers![0] as? TableViewControllerVacciList
        let img = UIImageView(image: tableController?.defaultImage)
        view.leftCalloutAccessoryView = img */
        
        // **************************
        }
}

