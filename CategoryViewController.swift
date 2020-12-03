//
//  CategoryViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 30/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase
class CategoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var logOutBtn: UIButton!
    
    
    
    let category = ["Men","Toys","Headphone","Health","Shoe","Women","Fitness","Cars"]
    var categoryImg = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryImg = [#imageLiteral(resourceName: "shrtt"),#imageLiteral(resourceName: "kidtoy"),#imageLiteral(resourceName: "headelec"),#imageLiteral(resourceName: "Health"),#imageLiteral(resourceName: "76-766443_n-a-shoe-circle-icon"),#imageLiteral(resourceName: "wcloth"),#imageLiteral(resourceName: "fitness"),#imageLiteral(resourceName: "carlogo")]
        // Do any additional setup after loading the view.
        
    }
    @IBAction func didLogOutBtn(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 2) {
            self.logOutBtn.isHidden = !self.logOutBtn.isHidden
            
        }
    }
    @IBAction func actionLogOut(_ sender: Any) {
      //  let out = self.storyboard?.instantiateViewController(withIdentifier: "main") as! MainViewController
      //  self.navigationController?.popToRootViewController(animated: true)
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isuserSignedIn")
            self.navigationController?.popViewController(animated: true)
        } catch let signOutError  {
            print(signOutError.localizedDescription)
        }
    }
}

// MARK :- CollectionViews Method

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCategoryCell
        
        cell.categoryLabel.text = category[indexPath.row]
        cell.imageView.image = categoryImg[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let menClotheVC = self.storyboard?.instantiateViewController(identifier: "MenClothesTableViewController")
            self.navigationController?.pushViewController(menClotheVC!, animated: true)
        } else if indexPath.row == 4 {
            let menClotheVC = self.storyboard?.instantiateViewController(identifier: "ShoeTableViewController")
                   self.navigationController?.pushViewController(menClotheVC!, animated: true)
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfColoumns: CGFloat = 2
        let cellSpacing: CGFloat = 2
        let xInsets: CGFloat = 2
        let width = collectionView.frame.size.width
        
        return CGSize(width: (width / noOfColoumns) - (xInsets + cellSpacing), height: (width / noOfColoumns) - (xInsets + cellSpacing))
    }
    
}
