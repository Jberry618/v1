//
//  LoginPageViewController.swift
//  MidtermProject
//
//  Created by Joshua T. Berry on 11/29/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import Eureka
import Firebase
import FirebaseAuth
import FirebaseDatabase
import LocalAuthentication

class LoginPageViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var confirmation: UILabel!
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    let emailKey = "email" //
    let passwordKey = "password" //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Authorization Page"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: AnyObject) {
        if email.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
                if error == nil {
                    self.confirmation.text = "You have successfully signed up."

                    
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Homepage")
//                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func login(_ sender: Any) {
        if (email.text?.count == 0 ) || (password.text?.count == 0) {
            self.confirmation.text = "Enter email and password"
            return
        }
        if let u = email.text, let p = password.text {
            Auth.auth().signIn(withEmail: u, password: p, completion: { (user, error) in
                if error == nil {
                    print ("Login successful")
                    self.confirmation.text = "Success"
                    UserDefaults.standard.set(u, forKey: self.emailKey)
                    UserDefaults.standard.set(p, forKey: self.passwordKey)
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                }
                else {
                    print ("Login failed")
                    print ((error?.localizedDescription)!)
                    self.confirmation.text = (error?.localizedDescription)!
                }
            })
        } else {
            self.confirmation.text = "Enter email and/or password"
        }
        
        
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
