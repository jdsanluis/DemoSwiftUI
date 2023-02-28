//
//  DeleteProductToWhisListUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 27/02/23.
//

import Foundation

protocol DeleteProductToWhisListUseCase {
    func invoke(product: Product)
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
    
    func invoke(product: Product) {
        dependencies
            .deleteProductFromWhistListAPI
            .invoke(product: product)
    }
}
