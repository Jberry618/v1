//
//  DriverSignInViewController.swift
//  MidtermProject
//
//  Created by Joshua T. Berry on 12/6/17.
//  Copyright © 2017 Monmouth University. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class DriverSignInViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    

    
    @IBAction func signIn(_ sender: UIButton) {
        OkAlert(withTitle: "Successful", andMessage: "Thank you, freight status and location has been updated.")
    }

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func backPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Location Managing starts here
    let locationManager = CLLocationManager()
    
    
    func OkAlert (withTitle title: String, andMessage message: String ) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        self.present (alert, animated: true)
    }

}
