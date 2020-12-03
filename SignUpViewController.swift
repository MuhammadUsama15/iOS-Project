//
//  SignUpViewController.swift
//  FarePriceProduct
//
//  Created by Mohammad Usama on 23/09/2020.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLable: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fixingFields()
    }
    
    func fixingFields(){
        Styling.styleTextField(firstNameTextField)
        Styling.styleTextField(lastNameTextField)
        Styling.styleTextField(emailTextField)
        Styling.styleTextField(passwordTextField)
        Styling.styleButton(signUpButton)
        
        // error label hide :-
        errorLable.alpha = 0
        indicator.alpha = 0
    }
    
    func formValidation() -> String? {
        
        // checking all fields are filled :-
         if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "please fill the fields!"
        }
      
        return nil
    }
    
    @IBAction func signUpTappedButton(_ sender: Any) {
        
        indicator.startAnimating()
        indicator.alpha = 1
        // Validate fields
        let error = formValidation()
        
        if error != nil {
            
            //there's something wrong
            displayErrorMessage(error!)
            
        } else {
            
            // Clean all the fields :-
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create Users :-
            Auth.auth().createUser(withEmail: email, password: password) { (succes, err) in
                
                // Check for errors :-
                if err != nil {
                    self.displayErrorMessage("Error Creating Users")
                    
                } else {
                    
                    
                    // Successfully Log in :-
                    
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstName": firstName, "lastName": lastName, "uid": succes!.user.uid]) { (error) in
                         
                        // For Error :-
                        if error != nil {
                            self.displayErrorMessage("Error saving user data")
                        }
                    }
                    
                    self.transitionToSkip()
                    
                }
            }
            
        }
        
    }
    
    func displayErrorMessage(_ message: String) {
        errorLable.text = message
        errorLable.alpha = 1
    }
    
    func transitionToSkip() {
 
        let skipViewController = storyboard?.instantiateViewController(identifier: Transition.Storyboard.skipVC) as? SkipViewController
        view.window?.rootViewController = skipViewController
        view.window?.makeKeyAndVisible()
    }
}
