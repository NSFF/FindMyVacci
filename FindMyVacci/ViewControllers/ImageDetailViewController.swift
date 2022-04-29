//
//  ImageDetailViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 29/04/2022.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var newImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = newImage

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToTableViewController(_ segue: UIStoryboardSegue){
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
