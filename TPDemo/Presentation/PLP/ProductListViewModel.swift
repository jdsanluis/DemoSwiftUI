//
//  ProductListViewModel.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

final class ProductListViewModel: ObservableObject {
    
    struct Dependencies {
        let getProductsUseCase: GetProductsUseCase = GetProductsUseCaseImp()
        let addProductToWhisListUseCase: AddProductToWhisListUseCase = AddProductToWhisListUseCaseImp()
    }
    
    @Published var products: [Product] = []
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
        getProducts()
    }
    
    private func getProducts() {
        dependencies
            .getProductsUseCase
            .invoke(completion: { products in
                self.products = products
            })
    }
    
    func addProductToWhistList(_ product: Product) {
        dependencies
            .addProductToWhisListUseCase
            .invoke(product: product )
    }
}
