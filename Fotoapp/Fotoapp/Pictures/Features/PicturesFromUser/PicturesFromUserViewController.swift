//
//  PicturesFromUserViewController.swift
//  Fotoapp
//
//  Created by Martín on 03/11/2020.
//

import UIKit

class PicturesFromUserViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonOut: UIButton!
    
    @IBAction func buttonAct(_ sender: Any) {
        print("Elige Foto Button Push")
    }
    
    
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
