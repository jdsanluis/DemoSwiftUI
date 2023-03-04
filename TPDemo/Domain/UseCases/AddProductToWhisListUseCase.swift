//
//  AddProductToWhisListUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

protocol AddProductToWhisListUseCase {
    func invoke(product: Product, completion: @escaping ((FancyToast?) -> ()))
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
    
    func invoke(product: Product, completion: @escaping ((FancyToast?) -> ())) {
        var toast: FancyToast?
        dependencies
            .addProductToWhistListAPI
            .invoke(product: product, completion: { isProductAdded in
                if isProductAdded {
                    toast = FancyToast(type: .success,
                                       message: "Product added to WhisList")
                } else {
                    toast = FancyToast(type: .success,
                                       message: "Try again later.!!")
                }
                completion(toast)
            })
    }
}
