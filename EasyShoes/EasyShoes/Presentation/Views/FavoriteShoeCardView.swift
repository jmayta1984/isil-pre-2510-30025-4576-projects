//
//  FavoriteShoeCardView.swift
//  EasyShoes
//
//  Created by user272495 on 6/11/25.
//

import SwiftUI

struct FavoriteShoeCardView: View {
    @State var showOptions = false
    @State var showSizes = false
    
    let favorite: FavoriteShoe
    
    let onDelete: () -> Void
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: favorite.image)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "shoe")
                        .scaledToFill()
                        .frame(width: 120, height:  100)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 120, height:  100)
                case .failure:
                    Image(systemName: "shoe")
                        .scaledToFill()
                        .frame(width: 120, height:  100)
                @unknown default:
                    EmptyView()
                        .frame(width: 120, height:  100)

                }
            }
            VStack (alignment: .leading, spacing: 8){
                Text(favorite.name)
                    .font(.headline)
                    .lineLimit(1)
                Text(String(format: "$ %i", favorite.price))
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Button {
                    showSizes.toggle()
                } label: {
                    HStack {
                        Text("Add to cart")
                        Image(systemName: "cart")
                    }
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.black, lineWidth: 1)
                        }
                }
                .buttonStyle(PlainButtonStyle())

            }
            Spacer()
            Button {
                showOptions.toggle()
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .font(.headline)
                    .rotationEffect(.degrees(90))
                    .foregroundStyle(.black)
                    .padding()
            }
            .buttonStyle(.borderless)


        }
        .padding(.vertical, 8)
        .padding(.horizontal, 4)
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .sheet(isPresented: $showOptions) {
            VStack (spacing: 10) {
                HStack {
                    Text("Options").bold()
                    Spacer()
                }
                HStack {
                    Image(systemName: "cart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    Text("Add to cart")
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    showOptions.toggle()
                    showSizes.toggle()
                }
                HStack {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                    Text("Remove from favorites")
                    Spacer()
                }
                .padding()
                .onTapGesture {
                    showOptions.toggle()
                    onDelete()
                }
                Spacer()
            }
            .padding()
            .presentationDetents([.height(200)])
        }
        
        .sheet(isPresented: $showSizes) {
            VStack (spacing: 10) {
                HStack {
                    Text("Sizes").bold()
                    Spacer()
                }
               
                Spacer()
            }
            .padding()
            .presentationDetents([.height(120)])
        }

    }
}
