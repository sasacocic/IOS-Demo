//
//  HomePageController.swift
//  IOS-Demo
//
//  Created by sasa cocic on 9/5/16.
//  Copyright © 2016 SasaCorp. All rights reserved.
//

import UIKit
import GoogleMaps

class HomePageController: UIViewController {
    
    override func viewDidLoad() {
        let camera = GMSCameraPosition.cameraWithLatitude(-33.86, longitude: 151.20, zoom: 14.0)
        let mapView = GMSMapView.mapWithFrame(CGRect.zero, camera: camera)
        mapView.myLocationEnabled = true
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
    }
    
    

}
