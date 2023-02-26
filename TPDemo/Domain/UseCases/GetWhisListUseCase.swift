//
//  GetWhisListUseCase.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

protocol GetWhisListUseCase {
    func invoke() -> [Product]
}

final class GetWhisListUseCaseImp {
    
    struct Dependencies {
        let getWhistListAPI: GetWhistListAPI = GetWhistListAPIImp()
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetWhisListUseCaseImp: GetWhisListUseCase {
    
    func invoke() -> [Product] {
        dependencies
            .getWhistListAPI
            .invoke()
    }
}
