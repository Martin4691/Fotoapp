//
//  RandomPicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 02/11/2020.
//

import UIKit

class RandomPicturesViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
////          SOLUCION CESC:
//        let randomNumber: Int = Int.random(in: 0..<ImagesData.numOfImages())
//        let img: UIImage? = ImagesData.imageForPosition(randomNumber)
//        imageView.image = img
//        print("random number: \(randomNumber)")
//
        imageView.image = getRandomPictures()
    }
    
    //          SOLUCION MIA:
    func getRandomPictures() -> UIImage? {
              let randomImage = ImagesData.imageForPosition(Int.random(in: 0...ImagesData.numOfImages()))
              print("image number: \(randomImage)")
              return randomImage
              }
//    imageView.image = getRandomPictures()
//


}

