//
//  LoaferDetailTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 22/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class LoaferDetailTableViewCell: UITableViewCell {
    
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
            images = [#imageLiteral(resourceName: "98458ede1efcb37abed2a87ee49e9f4d"),#imageLiteral(resourceName: "s-l400"),#imageLiteral(resourceName: "609fec70536417f778d406d9af289a44_350x350")]
            pageController.numberOfPages = images.count
    }
}
        // MARK :- CollectionView Method

extension LoaferDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoaferShoeScrollingCell", for: indexPath) as! LoaferShoeScrollingCell
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
