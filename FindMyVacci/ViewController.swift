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
        
        // tableView.dataSource = self
        // tableView.delegate = self
        
        fetchVacci()
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

