//
//  PhotoFullVC.swift
//  Fotoapp
//
//  Created by Martín on 30/10/2020.
//

import UIKit

class PhotoFullVC: UIViewController {

    @IBOutlet weak var imageFullScreen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageFullScreen.image = PicturesViewModel.selectedImage
        
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
