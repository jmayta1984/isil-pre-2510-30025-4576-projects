//
//  Home.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        /*
        ZStack (alignment: .bottom){
            VStack {
            
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
            
            
            HStack {
                Image(systemName: "shoe")
                    .foregroundStyle(Color.customOrange)
                Spacer()
                Image(systemName: "heart")
                Spacer()
                Image(systemName: "cart")
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
        }
        
        */
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
        .tint(Color.customOrange)
         
        
        
    }
}


#Preview {
    Home()
}
