//
//  ProfileCard.swift
//  Credentials
//
//  Created by user272495 on 4/30/25.
//

import SwiftUI

struct ProfileCard: View {
    var name = "Profile"
    var birthday = Date()
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
                
            Text(name)
                .font(.title)
                .bold()
            Text(birthday.formatted(date: .abbreviated, time: .omitted))
            
        }
        .padding(32)
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8)
    }
}

#Preview {
    ProfileCard()
}
