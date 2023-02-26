//
//  FavoriteListViewModel.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

final class FavoriteListViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    init() {
        self.products = getProducts()
    }
    
    private func getProducts() -> [Product] {
        
        //TODO: add logic to get products from API
        return [
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description"),
            .init(name: "product1", price: 1235.99, image: "IMage", rating: 4.1, description: "description")
        ]
    }
}
