//
//  ContactListView.swift
//  Agenda
//
//  Created by user272495 on 4/23/25.
//

import SwiftUI

struct ContactListView: View {
    
    @State var contacts = [Contact]()
    
    @State var showDetail = false
    
    @State var selectContact: Contact? = nil
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    HStack {
                        Text(contact.name)
                        
                    }
                    .onTapGesture {
                        selectContact = contact
                        showDetail = true
                    }
                }
                .onDelete { indexSet in
                    contacts.remove(atOffsets: indexSet)
                }
                
                
            }
            .navigationTitle("Agenda")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        
                        selectContact = nil
                        showDetail = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ContactDetailView(
                    contact: selectContact,
                    onSave: { contact in
                        
                        if (selectContact == nil) {
                            contacts.append(contact)
                        } else {
                            contacts = contacts.map { it in
                                it == selectContact ? contact : it
                            }
                        }
                        
                    })
            }
        }
        
    }
}

#Preview {
    ContactListView()
}
