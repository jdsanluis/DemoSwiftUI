//
//  GetWhistListAPI.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation
import CoreData

protocol GetWhistListAPI {
    func invoke() -> [Product]
}

final class GetWhistListAPIImp {
    
    struct Dependencies {
        let userDefaults = UserDefaults.standard
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetWhistListAPIImp: GetWhistListAPI {
    
    func invoke() -> [Product] {
        var itemsInWhisList: [Product] = []
        let whisListKey = UserDefaults.Keys.myKey
        if let savedData = dependencies
            .userDefaults
            .object(forKey: whisListKey) as? Data {

            do{
                itemsInWhisList = try JSONDecoder().decode([Product].self,
                                                             from: savedData)

            } catch {
                print("Error info: \(error)")
            }
        }
        return itemsInWhisList
    }
}
