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
import Firebase
import FirebaseDatabase

class DriverSignInViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {


    let authStatus = CLLocationManager.authorizationStatus()
    let inUse = CLAuthorizationStatus.authorizedWhenInUse
    let always = CLAuthorizationStatus.authorizedAlways
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationAddress: UILabel!
    @IBOutlet weak var driverName: UITextField!
    
    let locationManager = CLLocationManager()
    

    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func backPressed(_ sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Homepage")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We will not be using always authorization because this is a one-time sign in and should only happen when the app is open.
        locationManager.requestAlwaysAuthorization()
        
        // Only when app is open
//        locationManager.requestWhenInUseAuthorization()
        
        // Check if location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        mapView.showsUserLocation = true
    }
        // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Print out the location to the console
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: true)
    }
    
    @IBAction func signIn(_ sender: AnyObject) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error in
            
            var ref: DatabaseReference!
            ref = Database.database().reference()
            let user = Auth.auth().currentUser
            guard let addressDict = placemarks?[0].addressDictionary else {
                return
            }
            
            // Print each key-value pair in a new row
            addressDict.forEach { print($0) }
            
            // Print fully formatted address
            if let formattedAddress = addressDict["FormattedAddressLines"] as? [String] {
                ref?.child("users").child(self.driverName.text!).setValue(formattedAddress)
            }
            
            // Access each element manually
            if let locationName = addressDict["Name"] as? String {
//                print(locationName)
                  self.locationAddress.text = locationName
            }
        })
        if (authStatus == inUse ||
            authStatus == always)
        {
            let latitude = locationManager.location?.coordinate.latitude
            let longitude = locationManager.location?.coordinate.longitude
            print("Longitude: ", longitude!)
            print("Latitude:", latitude!)
        } else {
            locationAddress.text = "Location not authorized"
        }
        
    
        
    }
    //if denied access
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if(status == CLAuthorizationStatus.denied) {
            showLocationDisabledPopUp()
        }
    }
    
    // Show the popup to the user if we have been deined access
    func showLocationDisabledPopUp() {
        let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                message: "We need your location for your status to be updated.",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alertController.addAction(openAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    func OkAlert (withTitle title: String, andMessage message: String ) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        })
        self.present (alert, animated: true)
    }

}
