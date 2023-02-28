//
//  AddProductToWhisListUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

protocol AddProductToWhisListUseCase {
    func invoke(product: Product, completion: @escaping ((Bool) -> ()))
}

final class AddProductToWhisListUseCaseImp {
    
    struct Dependencies {
        let addProductToWhistListAPI: AddProductToWhistListAPI = AddProductToWhistListAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension AddProductToWhisListUseCaseImp: AddProductToWhisListUseCase {
    
    func invoke(product: Product, completion: @escaping ((Bool) -> ())) {
        dependencies
            .addProductToWhistListAPI
            .invoke(product: product, completion: { isProductAdded in
                completion(isProductAdded)
            })
    }
}
