//
//  HomeView.swift
//  EasyShoes
//
//  Created by user272495 on 5/21/25.
//

import SwiftUI

struct HomeView: View {
    
 
    
    @StateObject var viewModel = HomeViewModel()
    @State var selectedShoe: Product? = nil
    var body: some View {
        
        
        ScrollView {
            VStack (spacing: 20) {
               
                
                Banner()
                
                switch viewModel.uiState {
                case .idle, .loading:
                    ProgressView()
                case .success(let shoes):
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], ) {
                        ForEach(shoes) { shoe in
                            ProductCardView(shoe: shoe)
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
                ProductDetailView(shoe: shoe)
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
