//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct ProductCardView: View {
    let shoe: Product
    var body: some View {
        VStack (alignment: .leading){
            AsyncImage(url: URL(string: shoe.image)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "shoe")
                        .frame(width: 120, height:  120)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image.resizable()
                        .frame(width: 120, height:  120)
                        .frame(maxWidth: .infinity)

                case .failure:
                    Image(systemName: "shoe")
                        .frame(width: 120, height:  120)
                        .frame(maxWidth: .infinity)
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height:  120)
                        .frame(maxWidth: .infinity)

                }
            }
          
            Text(shoe.name)
                .font(.headline)
                .lineLimit(1)
            Text(String(format: "$ %.2f", shoe.price))
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
