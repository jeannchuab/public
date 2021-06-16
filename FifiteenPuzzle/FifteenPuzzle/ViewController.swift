//
//  ViewController.swift
//  FifteenPuzzle
//
//  Created by Jeann Chuab on 14/06/2021.
//  Copyright © 2021 Jeann Chuab. All rights reserved.
//


//Next steps:
// Fix rows and coluns numbers
// Control x and y to allow only near cells to be moved

import UIKit

private let dimension = 4

class ViewController: UICollectionViewController {
    var data: [[Int]] = []
    var emptyIndexPath = IndexPath()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillRandomData()
    }
    
    func fillRandomData() {
        var interval: [Int] = []
        for index in 1...dimension*dimension {
            interval.append(index)
        }
        interval.shuffle()
        
        var lastIndex = 0
        for _ in 0...dimension-1 {
            data.append([interval[lastIndex],
                         interval[lastIndex + 1],
                         interval[lastIndex + 2],
                         interval[lastIndex + 3]])
                            
            lastIndex = lastIndex + dimension
        }
    }
            
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dimension
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dimension
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NumberCell
                
        let text = String(data[indexPath.section][indexPath.row])
        let lastNumber = String(dimension * dimension)
                
        if text == lastNumber {
            cell.backgroundColor = .white
            cell.textLabel.text = ""
            emptyIndexPath = indexPath
        } else {
            cell.textLabel.text = text
            cell.backgroundColor = UIColor(red: 100/255, green: 175/255, blue: 250/255, alpha: 1)
            cell.layer.cornerRadius = 6
        }
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var canSwitch = false
                
        if emptyIndexPath.section == indexPath.section {
            if indexPath.row == emptyIndexPath.row - 1 || indexPath.row == emptyIndexPath.row + 1 {
                canSwitch = true
            }
        } else if emptyIndexPath.row == indexPath.row {
            if indexPath.section == emptyIndexPath.section - 1 || indexPath.section == emptyIndexPath.section + 1 {
                canSwitch = true
            }
        }
        
        if canSwitch {
            if indexPath != emptyIndexPath {
                let temp = data[indexPath.section][indexPath.row]
                data[indexPath.section][indexPath.row] = dimension * dimension
                data[emptyIndexPath.section][emptyIndexPath.row] = temp
                collectionView.reloadItems(at: [emptyIndexPath, indexPath])
                emptyIndexPath = indexPath
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width * 0.22
        return CGSize(width: size, height: size)
    }
}
