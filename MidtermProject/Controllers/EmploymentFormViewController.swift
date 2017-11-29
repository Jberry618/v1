//
//  EmploymentFormViewController.swift
//  MidtermProject
//
//  Created by Francine Halczli on 11/6/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import Eureka
import Firebase

class EmploymentFormViewController: FormViewController {

    @IBOutlet weak var submit: UIBarButtonItem!
    
    @IBAction func submitClicked(_ sender: UIBarButtonItem) {
        OkAlert(withTitle: "Confirmation", andMessage: "Thank you, your submission has been received.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employment"
        form +++ Section("Personal Information")
            <<< TextRow(){ row in
                row.title = "Name"
                row.placeholder = "First Last"
            }
            <<< TextRow(){
                $0.title = "Street Address"
                $0.placeholder = "123 Main Street"
            }
            <<< TextRow(){
                $0.title = "City"
                $0.placeholder = "Clifton"
            }
            <<< TextRow(){
                $0.title = "State/Province"
                $0.placeholder = "New Jersey"
            }
            <<< PhoneRow(){
                $0.title = "Zip/Postal Code"
                $0.placeholder = "09999"
            }
            <<< PhoneRow(){
                $0.title = "Home Phone"
                $0.placeholder = "201-555-5555"
            }
            <<< PhoneRow(){
                $0.title = "Cell Phone"
                $0.placeholder = "201-555-5555"
            }
            <<< TextRow(){
                $0.title = "Cell Phone"
                $0.placeholder = "201-555-5555"
            }
            <<< EmailRow(){
                $0.title = "Email"
                $0.placeholder = "finkle@finkle.com"
            }
            <<< TextRow(){
                $0.title = "Best Time to Call"
                $0.placeholder = "6:45"
        }
        form +++ Section("Driver information")
        
        
        
        // Do any additional setup after loading the view.
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
    
    func OkAlert (withTitle title: String, andMessage message: String ) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        self.present (alert, animated: true)
    }

}
