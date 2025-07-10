//
//  HeroDetailView.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    let onToggle: () -> Void
    
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack (alignment: .bottomTrailing){
                AsyncImage(url: URL(string: hero.poster)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)

                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure(let error):
                        Text(error.localizedDescription)
                            .frame( height: 400)
                            .frame(maxWidth: .infinity)

                    @unknown default:
                        EmptyView()
                    }
                }
                Button {
                    onToggle()
                } label: {
                    
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.black)
                        .padding(12)
                        .background(.white)
                        .clipShape(Circle())
                        .padding()
                    
                }

            }
            
            VStack (alignment: .leading){
                Text(hero.name)
                    .font(.headline)
                Text(hero.fullName)
                    .font(.subheadline)
                
                Text("Power stats")
                    .font(.headline)
                Slider(value: .constant(hero.intelligence), in: 0...100 )
            }
            .padding()
            
            Spacer()
        }
    }
}
