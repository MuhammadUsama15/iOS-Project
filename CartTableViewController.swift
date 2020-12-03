//
//  CartTableViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 01/11/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell!", for: indexPath) as! CartTableViewCell
        
        return cell
    }
  
}
