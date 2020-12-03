//
//  MenClothesTableViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 04/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MenClothesTableViewController: UITableViewController {
    
    var listImgOfClothes = [UIImage]()
    let nameOfItem = ["T-Shirt", "Jacket", "Hoddy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listImgOfClothes = [#imageLiteral(resourceName: "pexels-ralph-rabago-3290886"),#imageLiteral(resourceName: "pexels-sindre-strøm-1040945"),#imageLiteral(resourceName: "pexels-hasib-khorami-1601241")]
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listImgOfClothes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenClothesList", for: indexPath) as! MenClothesListTableViewCell
        
        // configure the cell
        cell.imgOfClothes.image = listImgOfClothes[indexPath.row]
        cell.nameLbl.text = nameOfItem[indexPath.row]
        cell.layer.cornerRadius = 15
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let tshirtVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyProductTableViewController")
            self.navigationController?.pushViewController(tshirtVC!, animated: true)
        } else if indexPath.row == 1 {
            let JacketVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyJacketViewController")
            self.navigationController?.pushViewController(JacketVC!, animated: true)
        } else if indexPath.row == 2 {
            let HoddyVC = self.storyboard?.instantiateViewController(withIdentifier: "BuyHoddyTableViewController")
            self.navigationController?.pushViewController(HoddyVC!, animated: true)
               }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
}
