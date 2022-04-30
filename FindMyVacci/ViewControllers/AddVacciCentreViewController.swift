//
//  AddVacciCentreViewController.swift
//  FindMyVacci
//
//  Created by Huei Li Yap on 28/04/2022.
//

import UIKit

class AddVacciCentreViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var vacciName: UITextField!
    @IBOutlet weak var municipality: UITextField!
    @IBOutlet weak var street: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var latitude: UITextField!
    @IBOutlet weak var longitude: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    
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
        if segue.identifier == "imageDetailSegue" {
            let controller = segue.destination as! ImageDetailViewController
            controller.newImage = imageView.image
        }
        
        if segue.identifier == "unwindToVacciListDone" {
            let controller = segue.destination as! TableViewControllerVacciList

            controller.vacciList.append(VacciCentre(name:vacciName.text!,
                                                    municipality:municipality.text!,
                                                    street:street.text!,
                                                    zipCode:Int(zipCode.text!)!,
                                                    phoneNumber:phoneNumber.text!,
                                                    gps: [Float(latitude.text!), Float(longitude.text!)],
                                                    image:imageView.image!))
            
            controller.tableView.reloadData()
        }
    }
    
    @IBAction func unwindToAddVacciCentreController(_ segue: UIStoryboardSegue){
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
