//
//  GoogleMapHelper.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

import GoogleMaps

class GoogleMapHelper {
    static let shared = GoogleMapHelper()
    
    private init(){
        // TODO: your api key here
        GMSServices.provideAPIKey("YOUR API KEY")
    }
}

