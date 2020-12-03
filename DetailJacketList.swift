//
//  DetailJacketList.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 21/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

class DetailJacketList: UITableViewCell {
     
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
            images = [#imageLiteral(resourceName: "pexels-denis-zagorodniuc-2229712"),#imageLiteral(resourceName: "pexels-luis-quintero-1599980"),#imageLiteral(resourceName: "pexels-ralph-rabago-3290886"),#imageLiteral(resourceName: "pexels-sindre-strøm-1040945"),#imageLiteral(resourceName: "pexels-hasib-khorami-1601241"),#imageLiteral(resourceName: "pexels-luis-quintero-1599980")]
            pageController.numberOfPages = images.count
        }
    }
            // MARK :- CollectionView Method

   extension DetailJacketList: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
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
