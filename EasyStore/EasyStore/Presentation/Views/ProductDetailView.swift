//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import SwiftUI

struct ProductDetailView: View {
    let shoe: Product
    
    @StateObject var viewModel = ProductDetailViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            
            ZStack (alignment: .topTrailing) {
                AsyncImage(url: URL(string: shoe.image)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "shoe")
                            .frame(width: 200, height:  200)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image.resizable()
                            .frame(width: 200, height:  200)
                            .frame(maxWidth: .infinity)
                        
                    case .failure:
                        Image(systemName: "shoe")
                            .frame(width: 200, height:  200)
                            .frame(maxWidth: .infinity)
                    @unknown default:
                        EmptyView()
                            .frame(width: 300, height:  200)
                            .frame(maxWidth: .infinity)
                        
                    }
                }
                Button {
                    viewModel.toggleFavorite(shoe: shoe)
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                }
                
            }
       
            HStack {
                Text(shoe.name)
                    .font(.headline)
                Spacer()
                Text(String(format: "$ %i", shoe.price))
                    .font(.headline)
                
            }
            Text(shoe.brand)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Text(shoe.description)
            
            
            Spacer()
            Button(action: {
            }) {
                Text("Add to cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.customOrange)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
            }
            
            
            
        }
        .padding()
        .onAppear {
            viewModel.checkFavorite(id: shoe.id)
        }
    }
}
