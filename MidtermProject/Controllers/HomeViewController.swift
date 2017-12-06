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

    enum TabIndex : Int {
        case firstChildTab = 0
        case secondChildTab = 1
    }
    
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
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
