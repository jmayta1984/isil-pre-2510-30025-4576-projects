//
//  ProductLIstView.swift
//  InventoryMVVM
//
//  Created by user272495 on 5/7/25.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel = ProductListViewModel()
    
    @State var showDetail = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    Text(product.name)
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                ToolbarItem {
                    Button(action: {
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ProductDetailView()
            }
        }
    }
}

#Preview {
    ProductListView()
}
