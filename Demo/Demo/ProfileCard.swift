//
//  ProfileCard.swift
//  Demo
//
//  Created by user272495 on 4/16/25.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Luis Guillermo")
                .font(.title)
                .bold()
            Text("Docente a tiempo parcial")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
}

#Preview {
    ProfileCard()
}
