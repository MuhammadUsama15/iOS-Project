//
//  LoginViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 23/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fixingFields()
    }
    
    func fixingFields(){
        Styling.styleTextField(emailTextField)
        Styling.styleTextField(passwordTextField)
        Styling.styleButton(logInButton)
        
        // error label hide :-
        errorLabel.alpha = 0
        indicator.alpha = 0
    }
    
    func validation() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in the field"
        }
        
        return nil
    }
    
    @IBAction func logInTappedButton(_ sender: Any) {
        
        indicator.startAnimating()
        indicator.alpha = 1
        
        // Form Validate :-
        let error = validation()
        
        if error != nil {
            showError(error!)
        } else {
            
            // Clean in all the fields :-
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the Sign in :-
            
            Auth.auth().signIn(withEmail: email, password: password) { (success, err) in
                // Check for error :-
                if err != nil {
                    self.errorLabel.text = err!.localizedDescription
                    self.errorLabel.alpha = 1
                } else {
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["email":email, "password":password]) { (error) in
                        
                        if error != nil {
                            self.showError("Ops! there's something wrong")
                        }
                    }
                    // Successfully Done! :-
                    let skipViewController = self.storyboard?.instantiateViewController(identifier: Transition.Storyboard.skipVC) as? SkipViewController
                    self.view.window?.rootViewController = skipViewController
                    self.view.window?.makeKeyAndVisible()
                    
                }
            }
        }
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
}
