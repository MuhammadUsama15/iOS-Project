//
//  BuyHoddyTableViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 21/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
class BuyHoddyTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HoddyDetailTableViewCell", for: indexPath) as! HoddyDetailTableViewCell
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }


}
