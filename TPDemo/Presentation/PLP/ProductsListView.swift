//
//  ProductsListView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct ProductsListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.products, id: \.self) { product in
                        ProductListCellView(product: product)
                    }
                }
            }.navigationTitle(Text("Fake Store"))
        }
        
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
    }
}
