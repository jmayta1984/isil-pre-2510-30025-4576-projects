//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    var body: some View {
        VStack (alignment: .leading){
            AsyncImage(url: URL(string: shoe.image)) { image in
                image.resizable().frame(maxWidth: .infinity, maxHeight: 120)
            } placeholder: {
                ProgressView().frame(maxWidth: .infinity, maxHeight: 120)
            }
            Text(shoe.name)
                .font(.headline)
            Text(String(format: "$ %i", shoe.price))
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct Shoe: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let image: String
}

#Preview {
    ShoeCardView(shoe: Shoe(id: 1, name: "Nike Air Force 1", price: 90, image: "https://midwaysports.com/cdn/shop/files/NikeAirForce1BigKids_Shoes_5.png"))
}
