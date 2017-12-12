//  ContentInfoTableViewController.swift
//  MidtermProject
//
//  Created by Joshua T. Berry on 11/3/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
import UIKit
import Firebase

class ContactInfoTableViewController: UITableViewController, UITextFieldDelegate {

    var thisContact = JSONDictionary ()
    var labels = [String]()
    var editedTextField: UITextField?
    var contactModel = Contacts.sharedInstance

        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = String (thisContact["Name"] as! String)
            
            labels = Array (thisContact.keys)  // get the keys for labels
            
            if let index = labels.index (where: {$0 == "Name" }) {
                labels.remove(at: index)  //
            }
            
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return labels.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactInfoCell", for: indexPath) as! ContactDataTableViewCell
            
            // Configure the cell...
            
            cell.fieldLabel.text = labels[indexPath.row]
            
            let value = thisContact [labels[indexPath.row]]
            
            if let strValue = value as? String {
                cell.fieldValue.text = strValue
            }
            else if let intValue = value as? Int {
                cell.fieldValue.text = String(intValue)
                
            }
            
            // setup the tag to track this on edit and delegate to handle the edit
            cell.fieldValue.tag = indexPath.row
            cell.fieldValue.delegate = self
            
            return cell
        }
            
    
        func textFieldDidBeginEditing(_ textField: UITextField) {
            // do somethign
            print (textField.tag)
            editedTextField = textField
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            // do something
            thisContact [labels[textField.tag]] = textField.text as AnyObject
            editedTextField = nil
            
        }
        
        func OkAlert (withTitle title: String, andMessage message: String ) {
            let alert = UIAlertController(title: title , message: message, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            })
            self.present (alert, animated: true)
        }

}
