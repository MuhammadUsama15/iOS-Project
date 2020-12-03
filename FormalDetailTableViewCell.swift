//
//  FormalDetailTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 22/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//
import UIKit

class FormalDetailTableViewCell: UITableViewCell {
    
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
            images = [#imageLiteral(resourceName: "Phenkang-mens-formal-shoes-genuine-leather-oxford-shoes-for-men-black-2019-dress-shoes-wedding-shoes (1)"),#imageLiteral(resourceName: "Phenkang-mens-formal-shoes-genuine-leather-oxford-shoes-for-men-black-2019-dress-shoes-wedding-shoes"),#imageLiteral(resourceName: "wingtip-dress-shoes-leather-shoes-full-grain")]
            pageController.numberOfPages = images.count
    }
}
        // MARK :- CollectionView Method

extension FormalDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FormalShoeScrollingCell", for: indexPath) as! FormalShoeScrollingCell
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
