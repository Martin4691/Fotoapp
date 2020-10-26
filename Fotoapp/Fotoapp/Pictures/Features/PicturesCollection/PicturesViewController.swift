//
//  PicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 26/10/2020.
//

import Foundation
import UIKit


class PicturesViewController: UIViewController, UICollectionViewDelegate {
//    private let reuseIdentifier = String(describing: Pictures.self)
    
//    override func viewDidLoad() {
//        collectionView(PicturesCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//    }
    
}


extension PicturesViewController: UICollectionViewDataSource {
//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell Identifier", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

    
}
