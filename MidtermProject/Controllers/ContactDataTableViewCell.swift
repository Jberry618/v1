//
//  ContactDataTableViewCell.swift
//  MidtermProject
//
//  Created by Joshua T. Berry on 11/3/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import Firebase

class ContactDataTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var fieldValue: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
