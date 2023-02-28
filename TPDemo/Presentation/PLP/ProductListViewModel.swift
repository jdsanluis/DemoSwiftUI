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
        let deleteProductToWhisListUseCase: DeleteProductToWhisListUseCase = DeleteProductToWhisListUseCaseImp()
    }
    
    @Published var products: [Product] = []
    @Published var toast: FancyToast?
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func getProducts() {
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
        
        toast = FancyToast(type: .success,
                           message: "Se agrego")
        getProducts()
    }
    
    func deleteProductToWhistList(_ product: Product) {
        dependencies
            .deleteProductToWhisListUseCase
            .invoke(product: product)
        
        getProducts()
    }
}
