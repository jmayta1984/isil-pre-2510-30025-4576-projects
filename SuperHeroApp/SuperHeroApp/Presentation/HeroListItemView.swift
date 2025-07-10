//
//  HeroListItemView.swift
//  SuperHeroApp
//
//  Created by user272495 on 7/9/25.
//

import SwiftUI

struct HeroListItemView: View {
    let hero: Hero
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width:90, height: 90)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                case .failure(let error):
                    Text(error.localizedDescription)
                        .frame(width:90, height: 90)
                @unknown default:
                    EmptyView()
                }
            }
            VStack {
                Text(hero.name)
            }
        }
    }
}
