//
//  ShoeDetailTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 20/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit



class ShoeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!{
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
            images = [#imageLiteral(resourceName: "pexels-web-donut-19090"),#imageLiteral(resourceName: "pexels-mnz-1598505"),#imageLiteral(resourceName: "photo-1542291026-7eec264c27ff")]
            pageController.numberOfPages = images.count
    }
    @IBAction func order(_ sender: Any) {
        print("hello")
    }
       
}
        // MARK :- CollectionView Method

extension ShoeDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeScrollingImgCell", for: indexPath) as! ShoeScrollingImgCell
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
