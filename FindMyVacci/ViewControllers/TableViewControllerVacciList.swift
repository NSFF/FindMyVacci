//
//  TableViewControllerVacciList.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 27/04/2022.
//

import UIKit

class TableViewControllerVacciList: UITableViewController {

    var vacciList:[VacciCentre] = []
    
    var test = ["test1","test2","test3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaultiImage = load(fileName:"Images/default_Vacci_Centre.jpeg")
    
        
        vacciList.append(VacciCentre(name:"Pacheco", municipality:"Brussels", street:"Bd Pachéco 13", zipCode:1000, phoneNumber:"+32454113255", gps:[50.852891844045274, 4.3632796], image:defaultiImage!))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Load image
    private func load(fileName: String) -> UIImage? {
        let fileURL = URL(fileURLWithPath: #file.replacingOccurrences(of: "ViewControllers/TableViewControllerVacciList.swift", with: "") + fileName)
                          
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return test.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewVacciList", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.text = test[indexPath.row]
        	
        cell.contentConfiguration = config
        
        return cell
    }
    
    @IBAction func unwindToTableViewController(_ segue: UIStoryboardSegue){
        // placeholder to unwind
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
