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
//        guard let itemsInWhisList: [Product] = dependencies
//            .userDefaults
//            .array(forKey: "WhistList") as? [Product] else {
//            return []
//        }
        
//        let userDefaults = UserDefaults.standard
        // 1
        
        var itemsInWhisList: [Product] = []
        
        if let savedData = dependencies
            .userDefaults
            .object(forKey: "WhistList") as? Data {

            do{
                // 2
                itemsInWhisList = try JSONDecoder().decode([Product].self,
                                                             from: savedData)

            } catch {
                // Failed to convert Data to Contact
            }
        }
        
        return itemsInWhisList
    }
}
