//
//  ContactTableViewController.swift
//  MidtermProject
//
//  Created by Francine Halczli on 11/3/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import Firebase

class ContactTableViewController: UITableViewController {

    var contact = Contacts.sharedInstance
    var contacts = [JSONDictionary]()
    var selectedContact = JSONDictionary ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Company Contacts"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contacts = contact.getContactsList()
//        sortedContacts = contacts.sorted {($0["Contact Name"] as! String) < ($1["Contact Name"] as! String)}
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1  // we have just 1 section in the table
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
//        // Configure the cell..
        let thisContact = contacts[indexPath.row]
        
//        cell.textLabel?.text = (thisContact["Contact Name"] as! String)
//        //var subTitle = String(describing: thisContact["Phone"] as! Int )
//
//        //cell.detailTextLabel?.text = subTitle
//        return cell
        
        cell.textLabel?.text = (thisContact["Name"] as! String)
        var subTitle = String(describing: thisContact["Phone"] as! Int)
        cell.detailTextLabel?.text = subTitle
        
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // we can do any prep work we need
        if (segue.identifier == "infoSegue") {
            if let selectedRow = tableView.indexPathForSelectedRow?.row {
                selectedContact = contacts[selectedRow]
                let dvc = segue.destination as! ContactInfoTableViewController
                dvc.thisContact = selectedContact
            }
        }
    }
}
