//
//  DeleteProductToWhisListUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 27/02/23.
//

import Foundation

protocol DeleteProductToWhisListUseCase {
    func invoke(product: Product, completion: @escaping((FancyToast?) -> ()))
}

final class DeleteProductToWhisListUseCaseImp {
    
    struct Dependencies {
        let deleteProductFromWhistListAPI: DeleteProductFromWhistListAPI = DeleteProductFromWhistListAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension DeleteProductToWhisListUseCaseImp: DeleteProductToWhisListUseCase {
    
    func invoke(product: Product, completion: @escaping((FancyToast?) -> ())) {
        var toast: FancyToast?
        dependencies
            .deleteProductFromWhistListAPI
            .invoke(product: product,
                    completion: { isProductDeleted in
                if isProductDeleted {
                    toast = FancyToast(type: .success,
                                             message: "Product deleted")
                } else {
                    toast = FancyToast(type: .success,
                                             message: "Try again later.!!")
                }
                completion(toast)
            })
    }
}
