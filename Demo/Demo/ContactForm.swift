//
//  ContactForm.swift
//  Demo
//
//  Created by user272495 on 4/16/25.
//

import SwiftUI

struct ContactForm: View {
    
    @State var name = ""
    
    @State var email = ""
    @State var isOn = false
    
    var body: some View {
        Form {
            Section(
                content: {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)

                },
                header: {
                    Text("General info")
                }
            )
            Section {
                Toggle("Suscription", isOn: $isOn)
            }
        }
    }
}

#Preview {
    ContactForm()
}
