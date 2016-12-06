//
//  ViewController.swift
//  nav2
//
//  Created by Sean Talts on 12/5/16.
//  Copyright © 2016 Sean Talts. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    var lm : CLLocationManager!
    var headingOverlay : UILabel!
    var locationOverlay : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupLocationStuff()
        
        headingOverlay = UILabel()
        headingOverlay.frame = CGRect(x: 10, y: 300, width: 200, height: 200)
        headingOverlay.text = "Start heading text"
        self.view.addSubview(headingOverlay)

        locationOverlay = UILabel()
        locationOverlay.frame = CGRect(x: 10, y: 200, width: 600, height: 100)
        locationOverlay.textColor = UIColor.red
        locationOverlay.text = "Start location text"
        self.view.addSubview(locationOverlay)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupLocationStuff() {
        lm = CLLocationManager()
        lm.delegate = self
        lm.requestWhenInUseAuthorization()
        lm.headingFilter = kCLHeadingFilterNone
        lm.distanceFilter = kCLDistanceFilterNone
        lm.startUpdatingLocation()
        lm.startUpdatingHeading()
        print("done setting up location stuff")
    }

    internal func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        headingOverlay.text = "\(newHeading.trueHeading)"
    }

    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coord = locations.last?.coordinate {
            locationOverlay.text = "\(coord.latitude), \(coord.longitude)"
        }
        print("update \(locations) ")
    }


}

