//
//  HoddyDetailTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 21/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//
import UIKit

   class HoddyDetailTableViewCell: UITableViewCell {
    
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
            images = [#imageLiteral(resourceName: "ssrco,mhoodiez,mens,322e3f_696a94a5d4,front,square_product,600x600-bg,f8f8f8"),#imageLiteral(resourceName: "ssrco,mhoodiez,mens,353d77_4d8b4ffd91,front,square_product,600x600-bg,f8f8f8.u1"),#imageLiteral(resourceName: "ssrco,mhoodiez,mens,101010_01c5ca27c6,front,square_product,600x600-bg,f8f8f8")]
            pageController.numberOfPages = images.count
    }
}
        // MARK :- CollectionView Method

extension HoddyDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HoddyScrollingCell", for: indexPath) as! HoddyScrollingCell
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
