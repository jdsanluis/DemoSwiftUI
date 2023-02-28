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
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
        getWhisList()
    }
    
    func getWhisList() {
        products = dependencies
            .getWhisListUseCase
            .invoke()
    }
    
    func deleteProductToWhistList(_ product: Product) {
        dependencies
            .deleteProductToWhisListUseCase
            .invoke(product: product)
        
        getWhisList()
    }
}
