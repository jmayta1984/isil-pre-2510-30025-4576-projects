//
//  GoogleMapView.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    var title: String? = nil
    var snippet: String? = nil
    
    func makeUIView(context: Context) -> some UIView {
        let position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let camera = GMSCameraPosition(target: position, zoom: 15)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let mapView = GMSMapView(options: options)
        
        let marker = GMSMarker(position: position)
        marker.title = title
        marker.snippet = snippet
        marker.map = mapView
        
        return mapView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
