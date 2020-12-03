//
//  CartTableViewCell.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 01/11/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cartImg: UIImageView!
    
    var cImg: UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cartImg.image = cImg
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
