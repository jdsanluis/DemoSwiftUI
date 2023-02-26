//
//  GetProductsUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

protocol GetProductsUseCase {
    func invoke(completion: @escaping (([Product]) -> ()))
}

final class GetProductsUseCaseImp {
    
    struct Dependencies {
        let getProductsAPI: GetProductsAPI = GetProductsAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetProductsUseCaseImp: GetProductsUseCase {
    
    func invoke(completion: @escaping (([Product]) -> ()))  {
        dependencies
            .getProductsAPI
            .invoke(completion: { products in
                completion(products.map{ $0.mapToProduct() })
            })
    }
}
