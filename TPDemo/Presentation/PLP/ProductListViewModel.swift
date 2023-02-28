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
            .invoke(completion: { [weak self] products in
                self?.products = products
            })
    }
    
    func addProductToWhistList(_ product: Product) {
        dependencies
            .addProductToWhisListUseCase
            .invoke(product: product, completion: { [weak self] isProductAdded in
                
                guard isProductAdded else {
                    self?.toast = FancyToast(type: .success,
                                             message: "Try again later.!!")
                    return
                }
                self?.toast = FancyToast(type: .success,
                                         message: "Product added to WhisList")
            })

        getProducts()
    }
    
    func deleteProductToWhistList(_ product: Product) {
        dependencies
            .deleteProductToWhisListUseCase
            .invoke(product: product, completion: { [weak self] isProductDeleted in
                
                guard isProductDeleted else {
                    self?.toast = FancyToast(type: .success,
                                             message: "Try again later.!!")
                    return
                }
                self?.toast = FancyToast(type: .success,
                                         message: "Product deleted")
            })
        
        getProducts()
    }
}
