//
//  Styling.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 23/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

class Styling {
    
   static func styleTextField(_ textField: UITextField) {
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        
        //background Color:-
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        //Removing Borders : -
        textField.borderStyle = .none
        
        // Add the line to the text field :-
        textField.layer.addSublayer(bottomLine)
    }
    
   static func styleHollowButton(_ button: UIButton) {

        button.layer.borderWidth = 2
        button.layer.backgroundColor = UIColor.init(white: 0, alpha: 0.5).cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white

    }
    
    static func styleButton(_ button: UIButton) {
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
   static func isValidPassword(_ password: String) -> Bool {
        
        let checkPassword = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z//d$@$#!%*?&]{8,}")
        return checkPassword.evaluate(with: password)
    }
}
