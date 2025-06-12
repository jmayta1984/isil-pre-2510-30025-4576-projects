//
//  HomeView.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    @State var selectedGenre = "All"
    
    let genres = ["All", "Men", "Women", "Kids"]
    
    @StateObject var viewModel = HomeViewModel()
    @State var selectedShoe: Shoe? = nil
    var body: some View {
        
        
        ScrollView {
            VStack (spacing: 20) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    TextField("Search", text: $search)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
                .padding()
                .background(.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Banner()
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(genres, id: \.self) { genre in
                            
                            Text(genre)
                                .padding(.horizontal)
                                .padding(.vertical, 10)
                            
                                .background(
                                    genre == selectedGenre ? Color.customOrange : .white)
                                .foregroundStyle(
                                    genre == selectedGenre ? .white : .gray)
                            
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .overlay(RoundedRectangle(cornerRadius: 20).stroke(
                                    genre == selectedGenre ? Color.customOrange : .gray, lineWidth: 1))
                                .onTapGesture {
                                    selectedGenre = genre
                                }
                        }
                    }
                }
                
                switch viewModel.uiState {
                case .idle, .loading:
                    ProgressView()
                case .success(let shoes):
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], ) {
                        ForEach(shoes) { shoe in
                            ShoeCardView(shoe: shoe)
                                .onTapGesture {
                                    self.selectedShoe = shoe
                                }
                        }
                    }
                case .failure(let string):
                    Text(string)
                }

                
      
            }
            .padding()
            .navigationDestination(item: $selectedShoe) { shoe in
                ShoeDetailView(shoe: shoe)
            }
        }
        .onAppear {
            viewModel.getShoes()
        }
    }
}

#Preview {
    HomeView()
}
