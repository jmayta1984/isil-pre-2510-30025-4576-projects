//
//  MapView.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map {
            
           Marker("ISIL", coordinate: CLLocationCoordinate2D(latitude: -12.1253808, longitude: -77.0248005))
        }
    }
}

#Preview {
    MapView()
}
