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
        let getWhistListAPI: GetWhistListAPI = GetWhistListAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetProductsUseCaseImp: GetProductsUseCase {
    
    func invoke(completion: @escaping (([Product]) -> ()))  {
        let whisList = dependencies.getWhistListAPI.invoke()
        
        dependencies
            .getProductsAPI
            .invoke(completion: { products in
                var productInStore: [Product] = products.map{ $0.mapToProduct()}
                
                for i in 0..<productInStore.count {
                    for item in whisList {
                        if productInStore[i].id == item.id {
                            productInStore[i].isInWhisList = true
                            continue
                        }
                    }
                }
                completion(productInStore)
            })
    }
}
