//
//  ProductDetailView.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/7/25.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel = ProductDetailViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Name", text: $viewModel.name)
                    TextField("Quantity", text: $viewModel.quantity)
                        .keyboardType(.numberPad)
                    
                }
                Section {
                    Button(action: {
                        if let product = viewModel.validate() {
                            dismiss()
                        }
                        
                    }) {
                        Text("Save")
                    }
                }
                if let error = viewModel.errorMessage {
                    Text(error).foregroundStyle(.red)
                }
            }
            .navigationTitle("New product")
        }
    }
}

#Preview {
    ProductDetailView()
}
