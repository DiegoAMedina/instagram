//
//  LoginViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/21/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.usernameField.delegate = self
        self.passwordField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
            (user: PFUser?, error: Error?) in
            
            if user != nil{
                print("You're logged in!")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else if let error = error{
                print("User login failed!")
                print(error.localizedDescription)
            }
        }
        
    }//onSignIn
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground {
            (success, error) -> Void in

            if let error = error{
                print(error.localizedDescription)
            }
            else{
                print("Created a new user")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            
        }//signUpInBackground
     
    }//onSignUp
    
    // hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return (true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
