//
//  LoginScreen.swift
//  Demo
//
//  Created by user272495 on 4/16/25.
//

import SwiftUI

struct LoginScreen: View {
    
    @State var username = ""
    @State var password = ""
    @State var isVisible = false
    
    var body: some View {
        VStack(spacing: 16){
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ZStack(alignment: .trailing) {
                Group {
                    if (isVisible) {
                        TextField("Password", text: $password)
                            .textInputAutocapitalization(.never)
                           
                    } else {
                        SecureField("Password", text: $password)
                            
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    
                    Image(systemName: isVisible ? "eye": "eye.slash")
                }
            }
            Button(action: {}) {
                Text("Sign in")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

            }
        }
        .padding()
    }
}

#Preview {
    LoginScreen()
}
