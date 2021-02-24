//
//  AboutUsController.swift
//  Food Delivery Service
//
//  Created by Mr Kes on 2/18/21.
//  Copyright © 2021 CemilKes. All rights reserved.
//

import UIKit
import CoreLocation

class AboutUsController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    

    @IBAction func callPhoneNumber(_ sender: Any) {
        callNumber(phoneNumber: "5107391138")
    }
    
    private func callNumber(phoneNumber:String) {

      if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {

        let application:UIApplication = UIApplication.shared
        if (application.canOpenURL(phoneCallURL)) {
            application.open(phoneCallURL, options: [:], completionHandler: nil)
        }
      }
    }
    
    @IBAction func openMap(_ sender: Any) {
        let geocoder = CLGeocoder()
        let str = "39060 Fremont Blvd, Fremont" // A string of the address info you already have
        geocoder.geocodeAddressString(str) { (placemarksOptional, error) -> Void in
          if let placemarks = placemarksOptional {
            print("placemark| \(String(describing: placemarks.first))")
            if let location = placemarks.first?.location {
              let query = "?ll=\(location.coordinate.latitude),\(location.coordinate.longitude)"
              let path = "http://maps.apple.com/" + query
              if let url = NSURL(string: path) {
                UIApplication.shared.openURL(url as URL)
              } else {
                // Could not construct url. Handle error.
                
              }
            } else {
              // Could not get a location from the geocode request. Handle error.
            }
          } else {
            // Didn't get any placemarks. Handle error.
          }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
