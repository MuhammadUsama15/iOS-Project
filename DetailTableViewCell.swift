//
//  DetailTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 09/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
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
        images = [#imageLiteral(resourceName: "3d5e2b41-e921-4f0f-9f24-06cbf8e1b547_1.9bf2f6b62da4e1427373c4ee9e5c3316"),#imageLiteral(resourceName: "plain-cotton-t-shirt-250x250"),#imageLiteral(resourceName: "ssrco,classic_tee,mens,101010_01c5ca27c6,front_alt,square_product,600x600.u2")]
        pageController.numberOfPages = images.count
    }
    
      @IBAction func addToCart(_ sender: Any) {
        print("hello")
          
       }
    
}
        // MARK :- CollectionView Method

extension DetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scrollingImg", for: indexPath) as! ScrollingImgCollectionViewCell
        cell.bunchOfimgs.image = images[indexPath.item]
        
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
