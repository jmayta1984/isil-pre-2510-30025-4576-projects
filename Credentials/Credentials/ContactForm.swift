//
//  ContactForm.swift
//  Credentials
//
//  Created by user272495 on 4/30/25.
//

import SwiftUI

struct ContactForm: View {
    @State var name = ""
    @State var birthday = Date()
    @State var showProfileCard = false
    
    var body: some View {
        NavigationStack {
            
            Form {
                Section {
                    TextField("Name", text: $name)
                    DatePicker(selection: $birthday, displayedComponents: [.date]) {
                        Text("Birthday")
                    }
                }
                Section {
                    Button(action: {
                        showProfileCard = true
                    }) {
                        Text("Create")
                    }
                }
                
                
            }
            .navigationTitle("Info")
            .sheet(isPresented: $showProfileCard) {
                ProfileCard(name: name, birthday: birthday)
            }
            
        }
        
    }
}

#Preview {
    ContactForm()
}
