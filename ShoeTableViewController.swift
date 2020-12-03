//
//  ShoeTableViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 18/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
class ShoeTableViewController: UITableViewController {
    
    var listImgOfClothes = [UIImage]()
    let nameOfItem = ["Sneakers", "Formal", "Loafers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImgOfClothes = [#imageLiteral(resourceName: "photo-1542291026-7eec264c27ff"),#imageLiteral(resourceName: "d44f58bdca44216f83bc6912d779e98a"),#imageLiteral(resourceName: "pexels-photo-267320")]
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listImgOfClothes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenClothesList", for: indexPath) as! ShowListTableViewCell
        
        // configure the cell
        cell.shoeImgs.image = listImgOfClothes[indexPath.row]
        cell.nameLbl.text = nameOfItem[indexPath.row]
        cell.layer.cornerRadius = 15
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sneakersVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyProduct2TableViewController")
            self.navigationController?.pushViewController(sneakersVC!, animated: true)
        } else  if indexPath.row == 1 {
            let formalShoeVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyFormalShoeTableViewController")
            self.navigationController?.pushViewController(formalShoeVC!, animated: true)
        }else  if indexPath.row == 2 {
            let loaferVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyLoaferShoeTableViewController")
            self.navigationController?.pushViewController(loaferVC!, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
