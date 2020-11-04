//
//
//
//

import Foundation
import UIKit

class ImagesData {
    static var imagesUrl: [URL]? = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)
    private static var likedImages: [Bool] = [Bool](repeating: false, count: numOfImages())
    
    static func numOfImages() -> Int {
        guard let pathUrls: [URL] = imagesUrl else { return 0 }
        return pathUrls.count
    }
    
    static func imageForUrl(_ url: URL) -> UIImage? {
        let imageName: String = url.lastPathComponent
        let img: UIImage? = UIImage(named: imageName)
        return img
    }
    
    static func imageForPosition(_ position: Int) -> UIImage? {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            if let url: URL = imagesUrl?[arrayIndex] {
                return imageForUrl(url)
            }
        }
        return nil
    }
    
    static func likeImageAtPosition(_ position: Int) {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            likedImages[position] = true
        }
    }
    
    static func dislikeImageAtPosition(_ position: Int) {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            likedImages[position] = false
        }
    }
    
    static func likeForPosition(_ position: Int) -> Bool {
        let arrayIndex: Int = position % numOfImages()
        if arrayIndex < numOfImages() {
            return likedImages[arrayIndex]
        }
        return false
    }
}

