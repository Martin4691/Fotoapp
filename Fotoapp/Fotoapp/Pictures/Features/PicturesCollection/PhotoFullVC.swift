//
//  PhotoFullVC.swift
//  Fotoapp
//
//  Created by Martín on 30/10/2020.
//

import UIKit

class PhotoFullVC: UIViewController {

    @IBOutlet weak var imageFullScreen: UIImageView!
    
    
    @IBOutlet weak var closeOutlet: UIButton!
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchOutlet.isOn == true {
            print("Switch Is On!")
        } else if switchOutlet.isOn == false {
            print("Switch Is Off!")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closeOutlet.layer.cornerRadius = 20
        imageFullScreen.image = PicturesViewModel.selectedImage
        
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
