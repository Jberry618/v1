//
//  HomeViewController.swift
//  MidtermProject
//
//  Created by Francine Halczli on 11/2/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var picCBF: UIImageView!
    
    @IBOutlet weak var newText: UITextView!
    @IBOutlet weak var homeText: UITextView!
    
    @IBOutlet weak var picTruck: UIImageView!
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            aboutView.isHidden = false
            picTruck.isHidden = true
            picCBF.isHidden = false
//            aboutLabel.isHidden = false
            copyrightLabel.isHidden = false
        case 1:
            aboutView.isHidden = true
            picTruck.isHidden = false
            picCBF.isHidden = true
//            aboutLabel.isHidden = false
            copyrightLabel.isHidden = false
        default:
            aboutView.isHidden = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
