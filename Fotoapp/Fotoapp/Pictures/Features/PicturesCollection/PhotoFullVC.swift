//
//  PhotoFullVC.swift
//  Fotoapp
//
//  Created by Martín on 30/10/2020.
//

import UIKit

class PhotoFullVC: UIViewController {

    //MARK: - OUTLETS:
    @IBOutlet weak var likeOutlet: UILabel!

    @IBOutlet weak var imageFullScreen: UIImageView!
    
    @IBOutlet weak var titleOutlet: UITextField!
    
    @IBOutlet weak var closeOutlet: UIButton!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var labelOutlet: UILabel!

    // MARK: - APPEARS + Siwtch Button:
    
    override func viewDidAppear(_ animated: Bool) {
        guard let unwrappingNumber: Int = PicturesViewModel.selectedIndex else {
            print("nill evitado")
            return
        }
        switchOutlet.isOn = ImagesData.likeForPosition(unwrappingNumber)
        titleOutlet.text = ImagesData.getTitle(unwrappingNumber)
        let favorite: String = switchOutlet.isOn ? "Favorite" : "No Favorite"
        labelOutlet.text = "\(favorite) \n\(titleOutlet.text!) \n\(unwrappingNumber + 1)"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        guard let unwrappingNumber: Int = PicturesViewModel.selectedIndex else {
            print("nill evitado")
            return
        }
        ImagesData.setTitle("\(titleOutlet.text!)", position: unwrappingNumber)
        print(titleOutlet.text!)
    }
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        guard let unwrappingNumber: Int = PicturesViewModel.selectedIndex else {
            print("nill evitado")
            return
        }
        if switchOutlet.isOn == true {
            ImagesData.likeImageAtPosition(unwrappingNumber)
            print("Switch Is On!")
        } else if switchOutlet.isOn == false {
            ImagesData.dislikeImageAtPosition(unwrappingNumber)
            print("Switch Is Off!")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let unwrappingNumber: Int = PicturesViewModel.selectedIndex else {
            print("nill evitado")
            return
        }
        closeOutlet.layer.cornerRadius = 20
        imageFullScreen.image = PicturesViewModel.selectedImage
        titleOutlet.text = "Imagen Nº: \(unwrappingNumber)"

        closeAction(self)
        
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
