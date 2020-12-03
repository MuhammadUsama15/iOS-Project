//
//  JacketDetailCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 21/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class JacketDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var images = [UIImage]()
    var currentIndex = 0
    
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            images = [#imageLiteral(resourceName: "fd68f7e50d984fa5df97a2d0da10ddd8"),#imageLiteral(resourceName: "204-2040992_zipper-black-leather-jackets-men-hd-png-download"),#imageLiteral(resourceName: "78-787853_mens-jackets")]
            pageController.numberOfPages = images.count
    }
}
        // MARK :- CollectionView Method

extension JacketDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JacketScrollingCell", for: indexPath) as! JacketScrollingCell
            cell.bunchOfImgs.image = images[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int((scrollView.contentOffset.x / collectionView.frame.size.width))
        pageController.currentPage = currentIndex
    }
}
