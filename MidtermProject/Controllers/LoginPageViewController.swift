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

    let userModel = UserModel.sharedInstance
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
    
    @IBAction func signUp(_ sender: UIButton) {
        userModel.registerUser(email: email.text!, password: password.text!, completionHandler: { (_ success) in
            if (success) {
                print ("registration successful")
                self.confirmation.text = "registration successful"
            }
            else {
                print ("register failed")
                self.confirmation.text = "registration failed"
            }
        })
    }
    
    @IBAction func login(_ sender: UIButton) {
     let u = email.text
     let p = password.text
        
        userModel.verifyLogin(email: u!, password: p!,
                              completionHandler: { (success) in
                                if (success) {
                                    self.confirmation.text = "Login successful"
                                    self.email.text = ""
                                    self.password.text = ""
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Homepage")
                                    self.present(vc!, animated: true, completion: nil)
                                }
                                else {
                                    self.confirmation.text = "Login failed"
                                    self.email.text = ""
                                    self.password.text = ""
                                }
                                
        })
        
        
        
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
