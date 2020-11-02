//
//  RandomPicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 02/11/2020.
//

import UIKit

class RandomPicturesViewController: UIViewController {
    var timer: Timer = Timer()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPicture()
        // timer viejo de obj C:
        //        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(refreshPicture), userInfo: nil, repeats: true)
        
        //timer nuevo de Swift:
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { _ in self.refreshPicture()
        })
        
        //          SOLUCION CESC para imagen aleatoria (tiene que ir dentro de la viewDidLoad):
        //        let randomNumber: Int = Int.random(in: 0..<ImagesData.numOfImages())
        //        let img: UIImage? = ImagesData.imageForPosition(randomNumber)
        //        imageView.image = img
        //        print("random number: \(randomNumber)")
    }
    
    //          SOLUCION MIA para imagen aleatoria:
    func getRandomPictures() -> UIImage? {
        let randomImage = ImagesData.imageForPosition(Int.random(in: 0...ImagesData.numOfImages()))
        print("image number: \(randomImage)")
        return randomImage
    }
    //    imageView.image = getRandomPictures()
    //    (esta es la llamda a mi solucion para imagen aleatoria).
    
    // timer viejo de obj C:
    //    @objc func refreshPicture() {
    //        imageView.image = getRandomPictures()
    //    }
    
    //timer nuevo de Swift:
    func refreshPicture() {
        UIView.transition(with: imageView,
                          duration: 1.0,
                          options: .transitionCurlUp,
                          animations: {
                            self.imageView.image = self.getRandomPictures()
                          },
                          completion: nil)
        
    }
    
}
