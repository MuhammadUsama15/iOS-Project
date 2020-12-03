//
//  OrderViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 11/10/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var logOutBtn: UIButton!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phoneNum: UITextField!
    @IBOutlet weak var productNum: UITextField!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fixingFields()

    }
    
    func fixingFields() {
        Styling.styleTextField(address)
        Styling.styleTextField(phoneNum)
        Styling.styleTextField(productNum)
        Styling.styleHollowButton(orderBtn)
        
        errorLbl.alpha = 0
    }
    
    func formValidation() -> String? {
        if address.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||  phoneNum.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            productNum.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all the fields!"
        }
        
        return nil
    }
    
    @IBAction func didTapOrder(_ sender: Any) {
        
        // There is unfill textfields :-
        
        let fields = formValidation()
        if fields != nil {
            errorLbl.alpha = 1
            errorLbl.text = "Ops missing fields!"
        } else {
            confirmOder()
        }
    }
    
    @IBAction func didLogOutBtn(_ sender: UIBarButtonItem) {
            UIView.animate(withDuration: 15) {
                self.logOutBtn.isHidden = !self.logOutBtn.isHidden
                
            }
        }
    @IBAction func actionLogOut(_ sender: Any) {
          //  let out = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let vc = MainViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationController?.popToRootViewController(animated: true)
       
        }
    func confirmOder() {
        
        let alert = UIAlertController(title: "Done!", message: "Thank you for shopping", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        //error label hide :-
        errorLbl.alpha = 0
    }
    
}
