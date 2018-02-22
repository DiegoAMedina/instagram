//
//  LoginViewController.swift
//  instragram
//
//  Created by Diego Medina on 2/21/18.
//  Copyright © 2018 Diego Medina. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground {
            (success, error) -> Void in
            
            if let error = error{
                
                print(error.localizedDescription)
                
                if let errorString = (error as NSError).userInfo["error"] as? String{
                    NSLog(errorString)
                    print("ERROR")
                }
            }
            else{
                print("Created a new user")
            }
            
            
            
        }//signUpInBackground
        
        
     
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
