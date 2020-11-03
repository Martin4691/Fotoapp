//
//  PicturesFromUserViewController.swift
//  Fotoapp
//
//  Created by Martín on 03/11/2020.
//

import UIKit
import Photos

class PicturesFromUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var image: UIImageView!
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    @IBOutlet weak var buttonOut: UIButton!
    
    @IBAction func buttonAct(_ sender: Any) {
        print("Button Push")
        func openGallary()
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        openGallary()
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageCameraRoll = info[.editedImage] as? UIImage
        image.image = imageCameraRoll
        dismiss(animated: true)
    }

    //      //SOLUCION CESC PARA IMAGE PICKER CONTROLLER:
    //        if UIImagePickerController.isSourceTypeAviable(.savedPhotosAlbum) {
    //            imagePicker.delegate = self
    //            imagePicker.sourceType = .savedPhotosAlbum
    //            imagePicker.allowsEditing = false
    //
    //            present(imagePicker, animated: true, completion: nil)
    //        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOut.layer.cornerRadius = 10
        image.image = UIImage(named: "pic1")
        
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
