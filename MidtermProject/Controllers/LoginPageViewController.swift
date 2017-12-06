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
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Authorization Page"
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        let u = email.text
        let p = password.text
        
//        FirebaseApp.auth()!.signIn(withEmail: u!, password: p!, completion: { (user, error) in
//            if error == nil {
//                print ("login successful")
//                self.message.text = "success"
//                UserDefaults.standard.set(u!, forKey: self.emailKey)
//                self.performSegue(withIdentifier: "loginSegue", sender: self)
//            }
//            else {
//                print ("login failed")
//                print ((error?.localizedDescription)!)
//                self.message.text = (error?.localizedDescription)!
//            }
//        })
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
