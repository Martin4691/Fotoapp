//
//  PicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 26/10/2020.
//

import Foundation
import UIKit


class PicturesViewController: UIViewController {
  private let maxHorizontalCells: CGFloat = 0.0
  private let marginBetweenCells: CGFloat = 0.0
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
  // Este método no es necesario.
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
    cell.backgroundColor = .blue
    
    if let pictureCell = (cell as? PicturesCell) {
      pictureCell.label.text = "\(indexPath.row + 1)"
      
      //         METODO CESC: -------(para acceder a los pares/impares)

      //            pictureCell.image.image = indexPath.row % 2 == 0 ? #imageLiteral(resourceName: "pic1"):#imageLiteral(resourceName: "pic2")
      
      //    metodo internet:  -------(para acceder a los pares/impares)
      if indexPath.row % 2 == 0 {
        pictureCell.image.image = UIImage(named: "pic1")
      } else {
        pictureCell.image.image = UIImage(named: "pic2")
      }
      
    }
    return cell
  }
}

extension PicturesViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView,
                      didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
  }
}

extension PicturesViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
    return CGSize(width: 75, height: 75)
  }
  
  func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat {
    
    return maxHorizontalCells
  }
  
  func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt: Int) -> CGFloat {
    
    return marginBetweenCells
  }
  
  
}








