//
//  ShoeDetailView.swift
//  EasyShoes
//
//  Created by user272495 on 6/4/25.
//

import SwiftUI

struct ShoeDetailView: View {
    let shoe: Shoe
    
    @State var selectedSize: ShoeSize? = nil
    @StateObject var viewModel = ShoeDetailViewModel()
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            
            ZStack (alignment: .topTrailing) {
                AsyncImage(url: URL(string: shoe.image)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "shoe")
                            .scaledToFill()
                            .frame(width: 300, height:  200)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 300, height:  200)
                            .frame(maxWidth: .infinity)
                        
                    case .failure:
                        Image(systemName: "shoe")
                            .scaledToFill()
                            .frame(width: 300, height:  200)
                            .frame(maxWidth: .infinity)
                    @unknown default:
                        EmptyView()
                            .scaledToFill()
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
            
            Text("Sizes")
                .font(.headline)
            
            ScrollView (.horizontal){
                HStack {
                    ForEach(shoe.sizes, id: \.size) { size in
                        Text(size.size)
                            .frame(width: 40, height: 40)
                            .background(selectedSize == size ? Color.customOrange : Color.white)
                            .foregroundStyle(selectedSize == size ? Color.white : Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .onTapGesture {
                                selectedSize = size
                            }
                    }
                }
            }
            
            Spacer()
            Button(action: {
            }) {
                Text("Add to cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedSize == nil ? Color.gray : Color.customOrange)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                
            }
            
            .disabled(selectedSize == nil)
            
            
        }
        .padding()
    }
}
