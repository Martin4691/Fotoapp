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
  
  @IBOutlet weak var stackScreen1: UIStackView!
  
  @IBOutlet weak var button1Out: UIButton!
  @IBOutlet weak var button2Out: UIButton!
  @IBOutlet weak var button3Out: UIButton!
  @IBOutlet weak var button4Out: UIButton!
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var cellHeigth: CGFloat = 75
  var cellWidth: CGFloat = 75
  
  override func viewDidLoad() {
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    // nib es igual que xib, pero con una nomenclatura antigua.
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    super.viewDidLoad()
    stackScreen1.layer.cornerRadius = 25
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
    return CGSize(width: cellWidth, height: cellHeigth)
  }
  
  func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat {
    
    return maxHorizontalCells
  }
  
  func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt: Int) -> CGFloat {
    
    return marginBetweenCells
  }
  
  // AQUI COMENZAMOS CON LOS BOTONES DEL ESTACK DE LA PRIMERA PANTALLA.
  func buttonSelected() {
    button1Out.isSelected = false
    button2Out.isSelected = false
    button3Out.isSelected = false
    button4Out.isSelected = false
  }
  @IBAction func button1Touched(_ sender: UIButton) {
    buttonSelected()
    sender.isSelected = true
    
    cellWidth = 414
    cellHeigth = 414
    collectionView.reloadData()
  }
  
  @IBAction func button2Touched(_ sender: UIButton) {
    buttonSelected()
    sender.isSelected = true
    
    cellWidth = 207
    cellHeigth = 207
    collectionView.reloadData()
  }
  
  @IBAction func button3Touched(_ sender: UIButton) {
    buttonSelected()
    sender.isSelected = true
    
    cellWidth = 103
    cellHeigth = 103
    collectionView.reloadData()
  }
  
  @IBAction func button4Touched(_ sender: UIButton) {
    buttonSelected()
    sender.isSelected = true
    
    cellWidth = 56
    cellHeigth = 56
    collectionView.reloadData()
  }
  
  
  
  
}








