//
//  RestaurantListView.swift
//  FoodLab
//
//  Created by user272495 on 7/2/25.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject var viewModel = RestaurantListViewModel()
    @State var selectedRestaurant: Restaurant? = nil
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.uiState {
                case .initialState, .loadingState:
                    ProgressView()
                case .successState(let restaurants):
                    List {
                        ForEach(restaurants) { restaurant in
                            RestaurantListItemView(restaurant: restaurant)
                                .onTapGesture {
                                    selectedRestaurant = restaurant
                                }
                        }
                       
                    }
                    .listStyle(.plain)
                    
                case .failureState(let message):
                    Text(message)
                }
            }
            .navigationDestination(item: $selectedRestaurant, destination: { restaurant in
                GoogleMapView(
                    latitude: restaurant.latitude,
                    longitude: restaurant.longitude,
                    title: restaurant.title
                )
            })
            .onAppear {
                viewModel.getAllRestaurants()
            }
        }
    }
}

#Preview {
    let _ = GoogleMapHelper.shared
    RestaurantListView()
}
