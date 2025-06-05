//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    var body: some View {
        VStack(alignment:.leading) {
            AsyncImage(url: URL(string: shoe.image)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "shoe")
                        .scaledToFill()
                        .frame(width: 400, height:  200)
                        .frame(maxWidth: .infinity)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 400, height:  200)
                        .frame(maxWidth: .infinity)

                case .failure:
                    Image(systemName: "shoe")
                        .scaledToFill()
                        .frame(width: 400, height:  200)
                        .frame(maxWidth: .infinity)
                @unknown default:
                    EmptyView()
                        .scaledToFill()
                        .frame(width: 400, height:  200)
                        .frame(maxWidth: .infinity)

                }
            }
          
            Text(shoe.name)
                .font(.headline)
                .lineLimit(1)
            Text(String(format: "$ %i", shoe.price))
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
    }
}
