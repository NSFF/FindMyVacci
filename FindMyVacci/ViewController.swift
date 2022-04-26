//
//  ViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 14/04/2022.
//

import UIKit

class ViewController: UIViewController {

    // Reference to the managed object context (= the core data container)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    // Data for the TableView
    var items:[VaccinationCentre]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fetchVacci()
    }
    
    func fetchVacci(){
        // Fetch data from core data
    }



}

