//
//  SkipViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 28/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class SkipViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var intro: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 50
        hideStuffs()
    }
    
    func hideStuffs() {
        welcome.alpha = 0
        intro.alpha = 0
        bgImg.alpha = 0
        button.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.2, animations: {
            self.bgImg.alpha = 1
        }) { (true) in
            self.showWelcomeTitle()
        }
    }
    
    func showWelcomeTitle() {
        UIView.animate(withDuration: 1.2, animations: {
            self.welcome.alpha = 1
        }) { (true) in
            self.showIntro()
        }
    }
    
    func showIntro() {
        UIView.animate(withDuration: 1.2, animations: {
            self.intro.alpha = 1
        }) { (true) in
            self.showButton()
        }
    }
        
    func showButton() {
        UIView.animate(withDuration: 1.2) {
            self.button.alpha = 1
        }
    }
        
}
