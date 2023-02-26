//
//  FavoritesListView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct FavoritesListView: View {
    var data: [Product] = [
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
        .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description")
    ]
    
    var body: some View {
        NavigationStack(){
            List(data) { product in
                FavoriteListCellView(product: product)
            }.navigationTitle(Text("Whis List"))
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
