//
//  ViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 22/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fixingFields()
           }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func fixingFields() {
        Styling.styleButton(loginButton)
        Styling.styleHollowButton(signUpButton)
    }

}

