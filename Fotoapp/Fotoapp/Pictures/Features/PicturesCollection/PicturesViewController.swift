//
//  PicturesViewController.swift
//  Fotoapp
//
//  Created by Martín on 26/10/2020.
//
import Foundation
import UIKit

class PicturesViewController: UIViewController {
    private var numOfHorizontalCells: CGFloat = 5.0
    private var marginBetweenCells: CGFloat = 4.0
    private let reuseIdentifier = String(describing: PicturesCell.self) // essto sirve para decir: PicturesCell
    
    @IBOutlet weak var stackScreen1: UIStackView!
    
    @IBOutlet weak var button1Out: UIButton!
    @IBOutlet weak var button2Out: UIButton!
    @IBOutlet weak var button3Out: UIButton!
    @IBOutlet weak var button4Out: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        // nib es igual que xib, pero con una nomenclatura antigua.
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        super.viewDidLoad()
        stackScreen1.layer.cornerRadius = 25
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        // ------> GUARD LET SOLUTION:
        
        //    guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        //
        //    if UIDevice.current.orientation.isLandscape {
        //      layout.scrollDirection = .horizontal
        //    } else if UIDevice.current.orientation.isPortrait {
        //      layout.scrollDirection = .vertical
        //    }
        //
        if UIDevice.current.orientation.isLandscape {
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .horizontal
            }
            print("Landscape")
        } else if UIDevice.current.orientation.isPortrait {
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
            }
            print("Portrait")
        } else if UIDevice.current.orientation.isFlat {
            print("Flat")
        } else if UIDevice.current.orientation.isValidInterfaceOrientation {
            print("Valid Interface Orientation")
        }
    }
}

// MARK: UICollectionViewDataSource
extension PicturesViewController: UICollectionViewDataSource {
    // Este método no es necesario.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  ImagesData.numOfImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if let pictureCell = (cell as? PicturesCell) {
            pictureCell.label.text = "\(indexPath.row + 1)"
            pictureCell.image.image = ImagesData.imageForPosition(indexPath.row)
        } else {
            cell.backgroundColor = .black
        }
        return cell
    }
}

// MARK: PicturesViewController
extension PicturesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        PicturesViewModel.selectedImage = ImagesData.imageForPosition(indexPath.row)
        PicturesViewModel.selectedIndex = indexPath.row
        performSegue(withIdentifier: "segueToDetail", sender: nil)
        print(indexPath.item)
    }
}

extension PicturesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width - (numOfHorizontalCells-1)*marginBetweenCells) / numOfHorizontalCells
        return CGSize(width: cellWidth, height: cellWidth)
    }
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout, minimumLineSpacingForSectionAt: Int) -> CGFloat {
        return marginBetweenCells
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
        
        numOfHorizontalCells = 1
        collectionView.reloadData()
    }
    
    @IBAction func button2Touched(_ sender: UIButton) {
        buttonSelected()
        sender.isSelected = true
        
        numOfHorizontalCells = 2
        collectionView.reloadData()
    }
    
    @IBAction func button3Touched(_ sender: UIButton) {
        buttonSelected()
        sender.isSelected = true
        
        numOfHorizontalCells = 3
        collectionView.reloadData()
    }
    
    @IBAction func button4Touched(_ sender: UIButton) {
        buttonSelected()
        sender.isSelected = true
        
        numOfHorizontalCells = 5
        collectionView.reloadData()
    }
    
    
    
    
}











