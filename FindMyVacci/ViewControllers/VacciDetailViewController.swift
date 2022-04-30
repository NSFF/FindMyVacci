//
//  VacciDetailViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 30/04/2022.
//

import UIKit

class VacciDetailViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var myImageView: UIImage?
    var myAddress:String?
    var myTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navBar.title = myTitle
        addressLabel.text = myAddress
        imageView.image = myImageView
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
