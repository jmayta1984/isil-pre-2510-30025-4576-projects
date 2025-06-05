//
//  Home.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct ContentView: View {
    let user: User
    var body: some View {
       
        TabView {
            Tab("Home", systemImage: "shoe") {
                HomeView()
            }
            
            
            Tab("Favorites", systemImage: "heart") {
                Text("Favorites")
            }
            Tab("Cart", systemImage: "cart") {
                Text("Cart")
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Text(user.fullname).font(.subheadline)
                    AsyncImage(url: URL(string: user.image)) { image in
                        image.resizable()
                            .frame(width: 24, height: 24)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundStyle(Color.customOrange)
                                    
                            }
                    } placeholder: {
                        
                    }

                }
            }
        }
        .tint(Color.customOrange)
         
        
        
    }
}
