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

class DriverSignInViewController: UIViewController {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func signIn(_ sender: UIButton) {
        OkAlert(withTitle: "Successful", andMessage: "Thank you, freight status and location has been updated.")
        
    }
    var locationManager: CLLocationManager!
    
    func setupLocationTracking () {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        print ("Location Updated")
        let location = locations.last as! CLLocation
        print (location)
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        var region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        region.center = mapView.userLocation.coordinate
        mapView.setRegion(region, animated: true)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
