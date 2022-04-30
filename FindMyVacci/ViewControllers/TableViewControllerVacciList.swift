//
//  TableViewControllerVacciList.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 27/04/2022.
//

import UIKit

class TableViewControllerVacciList: UITableViewController {

    var vacciList:[VacciCentre] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultiImage = load(fileName:"Images/default_Vacci_Centre.jpeg")
        
        // adding 2 default Vacci Centres
        vacciList.append(VacciCentre(name:"Pacheco", municipality:"Brussels", street:"Bd Pachéco 13", zipCode:1000, phoneNumber:"+32454113255", gps:[50.852891844045274, 4.3632796], image:defaultiImage!))
        vacciList.append(VacciCentre(name:"Point Vaccination", municipality:"Molenbeek", street:"Chau. de Gand 696", zipCode:1080, phoneNumber:"022141919", gps:[50.860205133203145, 4.30742968465714], image:defaultiImage!))
        
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
        return vacciList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewVacciList", for: indexPath)

        //var config = cell.defaultContentConfiguration()
        //config.text = vacciList[indexPath.row].name
        // config.image = vacciList[indexPath.row].image
        //cell.contentConfiguration = config
        
        cell.textLabel?.text = vacciList[indexPath.row].name
        // adjust size in case of long names
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        
        cell.detailTextLabel?.text = vacciList[indexPath.row].municipality
        cell.imageView?.image = vacciList[indexPath.row].image

        return cell
    }
    
    @IBAction func unwindToTableViewController(_ segue: UIStoryboardSegue){
        // placeholder to unwind
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "vacciDetailSegue" {
            let controller = segue.destination as! VacciDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow
            
            controller.myTitle = vacciList[indexPath!.row].name
            
            controller.myAddress = String(vacciList[indexPath!.row].zipCode) + " " + vacciList[indexPath!.row].municipality + ", " + vacciList[indexPath!.row].street
            
            controller.myImageView = vacciList[indexPath!.row].image
            controller.myPhoneNumber = vacciList[indexPath!.row].phoneNumber
            controller.gps = vacciList[indexPath!.row].gps
        }
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
