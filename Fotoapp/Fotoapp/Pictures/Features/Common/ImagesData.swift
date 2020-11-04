//
//  ImagesData.swift
//  photos
//
//  Created by Francesc Navarro on 26/10/2020.
//  Copyright © 2020 Bamboo Academy. All rights reserved.
//

import Foundation
import UIKit

class ImagesData {
    static var imagesUrl: [URL]? = Bundle.main.urls(forResourcesWithExtension: "jpg", subdirectory: nil)
    private static var likedImages: [Bool] = [Bool](repeating: false, count: numOfImages())
    private static var imagesTitle: [String] = [String](repeating: "Foto sin título", count: numOfImages())
    
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
    
    // MARK: - Like and Dislike
    static func likeImageAtPosition(_ position: Int) {
        let arrayIndex: Int = safeIndex(position)
        likedImages[arrayIndex] = true
    }
    
    static func dislikeImageAtPosition(_ position: Int) {
        let arrayIndex: Int = safeIndex(position)
        likedImages[arrayIndex] = false
    }
    
    static func likeForPosition(_ position: Int) -> Bool {
        let arrayIndex: Int = safeIndex(position)
        return likedImages[arrayIndex]
    }
    
    // MARK: - Image description
    static func setTitle(_ title: String, position: Int) {
        imagesTitle[position] = title
    }
    
    static func getTitle(_ position: Int) -> String {
        return imagesTitle[position]
    }
    
    // MARK: - Private utils
    private static func safeIndex(_ position: Int) -> Int {
        return position % numOfImages()
    }

}
