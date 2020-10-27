//
//  PicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 26/10/2020.
//

import Foundation
import UIKit


class PicturesViewController: UIViewController {
    private let reuseIdentifier = String(describing: PicturesCell.self) // essto sirve para decir: PicturesCell
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        // nib es igual que xib, pero con una nomenclatura antigua.
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        super.viewDidLoad()
    }
    
}

// MARK: UICollectionViewDataSource
extension PicturesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//        if let pictureCell.previewImage.image = indexPath.row % 2 == 0 ? _ : _
//    } else {
    cell.backgroundColor = .blue
//    }
    
    return cell
    }
}

extension PicturesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}






