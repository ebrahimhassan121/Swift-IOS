//
//  HomeController.swift
//  TwitterLTB
//
//  Created by ebrahim hassan on 8/16/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit
class HomeController: UICollectionViewController , UICollectionViewDelegateFlowLayout{
    let cellID="cellID"
    override func viewDidLoad() {
        collectionView?.backgroundColor = .blue
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell=collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width, height: 50)

    }
}
