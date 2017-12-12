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
    @IBOutlet weak var labelLatitude: UILabel!
    @IBOutlet weak var labelLongitude: UILabel!
    
    @IBAction func signIn(_ sender: UIButton) {
//        OkAlert(withTitle: "Successful", andMessage: "Thank you, freight status and location has been updated.")
    }

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func backPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            let locationManager = CLLocationManager()
        let latitude = locationManager.location?.coordinate.latitude
        let longitude = locationManager.location?.coordinate.longitude
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startMonitoringSignificantLocationChanges()
            
            labelLatitude.text = "latitude"
            labelLongitude.text = "latitude"
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Location Managing starts here
    
    
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
//
//            if (error != nil) {
//                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
//                return
//            }
//
//            if (placemarks?.count)! > 0 {
//
//                print("placemarks",placemarks!)
//                let pm = placemarks?[0]
//                self.displayLocationInfo(pm)
//            } else {
//                print("Problem with the data received from geocoder")
//            }
//        })
//    }
//
    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Error while updating location " + error.localizedDescription)
//    }
//}

//    func OkAlert (withTitle title: String, andMessage message: String ) {
//        let alert = UIAlertController(title: title , message: message, preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
//            self.navigationController?.popViewController(animated: true)
//        })
//        self.present (alert, animated: true)
//    }

}
