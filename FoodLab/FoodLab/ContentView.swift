//
//  ContentView.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            GoogleMapView(latitude: -12.1253808, longitude: -77.0248005)
        }
        
    
}

#Preview {
    let googleMapHelper = GoogleMapHelper.shared
    ContentView()
}
