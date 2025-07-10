//
//  SearchHeroView.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftUI
import SwiftData

struct SearchHeroView: View {
    @Environment(\.modelContext)  var context

    @StateObject private var viewModel = SearchHeroViewModel()
    

    @State var selectedHero: Hero? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search", text: $viewModel.query)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onSubmit {
                        viewModel.searchHeroes()
                    }
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal)
            
            switch viewModel.uiState {
            case .initialState:
                Spacer()
            case .loadingState:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .successState(let heroes):
                List {
                    ForEach(heroes) { hero in
                        HeroListItemView(hero: hero)
                            .onTapGesture {
                                selectedHero = hero
                            }
                    }
                }
                .listStyle(.plain)
            case .failureState(let message):
                Text(message)
            }
        }
        .sheet(item: $selectedHero) { hero in
            HeroDetailView(hero: hero) {
                viewModel.toggleFavorite(hero: hero, context: context)
            }
        }
    }
}

#Preview {
    SearchHeroView()
}
