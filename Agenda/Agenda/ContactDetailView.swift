//
//  ContactDetailView.swift
//  Agenda
//
//  Created by user272495 on 4/23/25.
//

import SwiftUI

struct ContactDetailView: View {
    
    var contact: Contact? = nil
    @State var name = ""
    @State var company = ""
    @Environment(\.dismiss) var dismiss
    var onSave: (Contact) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section (header: Text("General information")){
                    TextField("Name", text: $name)
                    TextField("Company", text: $company)
                }
            }
            .navigationTitle( contact == nil ? "New contact" : "Edit contact" )
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        let id: UUID
                        if let contact = contact {
                            id = contact.id
                        } else {
                            id = UUID()
                        }
                        
                        onSave(Contact(id: id,name: name, company: company))
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                if let contact = contact {
                    name = contact.name
                    company = contact.company
                }
            }
        }
        
    }
}

#Preview {
    ContactDetailView { _ in
        
    }
}
