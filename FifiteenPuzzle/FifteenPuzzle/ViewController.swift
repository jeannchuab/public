//
//  ViewController.swift
//  FifteenPuzzle
//
//  Created by Jeann Chuab on 14/06/2021.
//  Copyright © 2019 Jeann Chuab. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewController: UICollectionViewController {
    var alphabet = [String]()
    var emptyIndexPath = IndexPath(row: 15, section: 0) //TODO: Update after shuffle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Shuffle
        let str: String = "ABCDEFGHIJKLMNO "
        
        for i in str {
            alphabet.append(String(i))
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return alphabet.count
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let size = UIScreen.main.bounds.width * 0.1
//        return CGSize(width: size, height: size)
//    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
        cell.textLabel.text = alphabet[indexPath.row]
        
        if alphabet[indexPath.row].trimmingCharacters(in: .whitespaces).isEmpty {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = UIColor(red: 0, green: 249, blue: 0, alpha: 1.0)
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {                
        if indexPath != emptyIndexPath {
            print("\("Origem IndexPath:") \(indexPath)")
            print("\("emptyIndexPath:") \(emptyIndexPath)")
    //
    //        let cellOrigin = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AlphabetCell
    //        let cellDestination = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: emptyIndexPath) as! AlphabetCell
    //
    //        cellOrigin.alphabetLabel.text = String(emptyIndexPath.row)
    //        cellDestination.alphabetLabel.text = String(indexPath.row)

            let temp = alphabet[indexPath.row]
            alphabet[indexPath.row] = ""
            alphabet[emptyIndexPath.row] = temp
            
            collectionView.reloadItems(at: [emptyIndexPath, indexPath])
            emptyIndexPath = indexPath
    //        print("\("After: ")")
    //        print("\("emptyIndexPath:") \(emptyIndexPath)")
        }
    }
    
//    override func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: proposedIndexPath) as! AlphabetCell
//
//        if cell.alphabetLabel.text?.isEmpty ?? false {
//            return proposedIndexPath
//        } else {
//            return originalIndexPath
//        }
//    }
    
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let temp = alphabet[sourceIndexPath.row]
        alphabet[sourceIndexPath.row] = ""
        alphabet[emptyIndexPath.row] = temp
        emptyIndexPath = sourceIndexPath
        
//        let temp = alphabet.remove(at: sourceIndexPath.item)
//        alphabet.insert(temp, at: destinationIndexPath.item)
    }

}
