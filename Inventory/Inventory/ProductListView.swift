//
//  ProductListView.swift
//  Inventory
//
//  Created by user272495 on 4/30/25.
//

import SwiftUI

struct ProductListView: View {
    
    @State var products = [String]()
    @State var product = ""
    @State var selectedProduct: String? = nil
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                Form {
                    Section {
                        HStack {
                            
                            TextField("Name", text: $product)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                            
                            Button(action: {
                                if !product.isEmpty {
                                    
                                    if selectedProduct ==  nil {
                                        products.append(product)
                                    } else {
                                        products = products.map { it in
                                            it == selectedProduct ? product : it
                                        }
                                    }
                                    product = ""
                                    selectedProduct = nil
                                }
                                
                            }) {
                                Text("Save")
                            }
                        }
                        .padding(.trailing)
                    }
                }
                .frame(maxHeight: 100)
                
                List {
                    ForEach(products, id: \.self) { product in
                        Text(product)
                            .onTapGesture {
                                self.product = product
                                self.selectedProduct = product
                            }
                    }
                    .onDelete { indexSet in
                        products.remove(atOffsets: indexSet)
                    }
                }
            }
        }
        
    }
}

#Preview {
    ProductListView()
}
