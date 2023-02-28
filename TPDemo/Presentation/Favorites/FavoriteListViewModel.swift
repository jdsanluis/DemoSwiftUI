//
//  FavoriteListViewModel.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

final class FavoriteListViewModel: ObservableObject {
    
    struct Dependencies {
        let getWhisListUseCase: GetWhisListUseCase = GetWhisListUseCaseImp()
        let deleteProductToWhisListUseCase: DeleteProductToWhisListUseCase = DeleteProductToWhisListUseCaseImp()
    }
    
    @Published var products: [Product] = []
    @Published var toast: FancyToast?
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
    
    func getWhisList() {
        products = dependencies
            .getWhisListUseCase
            .invoke()
    }
    
    func deleteProductToWhistList(_ product: Product) {
        dependencies
            .deleteProductToWhisListUseCase
            .invoke(product: product, completion: { [weak self] isProductDeleted in
                
                if isProductDeleted {
                    self?.toast = FancyToast(type: .success,
                                             message: "Product deleted")
                } else {
                    self?.toast = FancyToast(type: .success,
                                             message: "Try again later.!!")
                }
            })
        
        getWhisList()
    }
}
