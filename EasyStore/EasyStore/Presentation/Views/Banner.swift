//
//  Banner.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        HStack  {
            VStack (alignment: .leading, spacing: 10) {
                Text("Get Your Special Sale")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .bold()
                Text("Up to 50%")
                    .foregroundStyle(Color.customOrange)
                Button(action: {}) {
                    Text("Shop Now")
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.customOrange)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            Image("banner-adidas")
                .resizable()
                .scaledToFit()
            
        }
        .padding()
        .background(LinearGradient(colors: [.black, .customOrange], startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
