//
//  PhotoFullVC.swift
//  Fotoapp
//
//  Created by Martín on 30/10/2020.
//

import UIKit

class PhotoFullVC: UIViewController {
    
    
    @IBOutlet weak var likeOutlet: UILabel!
    
    
    
    
    @IBOutlet weak var imageFullScreen: UIImageView!
    
    @IBOutlet weak var titleOutlet: UITextField!
    
    @IBOutlet weak var closeOutlet: UIButton!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var labelOutlet: UILabel!

    
    override func viewDidAppear(_ animated: Bool) {
        switchOutlet.isOn = ImagesData.likeForPosition(PicturesViewModel.selectedIndex!)
        titleOutlet.text = ImagesData.getTitle(PicturesViewModel.selectedIndex!)
        let favorite: String = switchOutlet.isOn ? "Favorite" : "No Favorite"
        labelOutlet.text = "\(favorite) \n\(titleOutlet.text!) \n\(PicturesViewModel.selectedIndex! + 1)"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        ImagesData.setTitle("\(titleOutlet.text!)", position: PicturesViewModel.selectedIndex!)
        print(titleOutlet.text!)
    }
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchOutlet.isOn == true {
            ImagesData.likeImageAtPosition(PicturesViewModel.selectedIndex!)
            print("Switch Is On!")
        } else if switchOutlet.isOn == false {
            ImagesData.dislikeImageAtPosition(PicturesViewModel.selectedIndex!)
            print("Switch Is Off!")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeOutlet.layer.cornerRadius = 20
        imageFullScreen.image = PicturesViewModel.selectedImage
        titleOutlet.text = "Imagen Nº: \(PicturesViewModel.selectedIndex!)"

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
