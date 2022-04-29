//
//  AddVacciCentreViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 28/04/2022.
//

import UIKit

class AddVacciCentreViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Pop-up Photo library on button press
    @IBAction func addImageBtn(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        
        picker.delegate = self
        present(picker, animated: true)
    }
    
    // Close the photo library and update the image preview (= imageView)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        guard let image = info[.editedImage] as? UIImage else {return}
        
        imageView.image = image
        
        dismiss(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "imageDetail" {
            let controller = segue.destination as! ImageDetailViewController
            controller.newImage = imageView.image
        }
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
