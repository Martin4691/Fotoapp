//
//  ImagesData.swift
//  Fotoapp
//
//  Created by Martín on 29/10/2020.
//
import UIKit
import Foundation

class ImagesData {
    static func numOfImages() -> Int {
      //Solución Guard let:
//      let urls: [URL]? = imagesUrl()
//      guard let pathUrls = urls else { return 0 }
//      return pathUrls.count
      
      // Solución IF LET:
      if let pathUrls: [URL] = imagesUrl() {
        return pathUrls.count
      } else {
        return 0
      }
      
      // Solución ??:
      // return imageUrl()?.count ?? 0
    }
    
    static func imagesUrl() -> [URL]? {
        return Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)
    }
    
    static func imageForUrl(_ url: URL) -> UIImage? {
      let imageName: String = url.lastPathComponent
//      return UIImage.init(imageLiteralResourceName: imageName)
      let img: UIImage? = UIImage(named: imageName)
      return img
    }
    
    static func imageForPosition(_ position: Int) -> UIImage? {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            if let url: URL = imagesUrl()?[arrayIndex] {
                return imageForUrl(url)
            }
        }
        return nil
    }
    
   
}




