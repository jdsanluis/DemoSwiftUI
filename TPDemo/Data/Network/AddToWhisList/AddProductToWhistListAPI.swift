//
//  DataController.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation
import CoreData

protocol AddProductToWhistListAPI {
    func invoke(product: Product)
}

final class AddProductToWhistListAPIImp {
    
    struct Dependencies {
        let userDefaults = UserDefaults.standard
    }
    
    var productsInWhisList: Data? {
        guard let itemsInWhisList: Data = dependencies
            .userDefaults
            .object(forKey: "WhistList") as? Data else {
            return nil
        }
        
        return itemsInWhisList
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension AddProductToWhistListAPIImp: AddProductToWhistListAPI {
    
    func invoke(product: Product) {
        guard var items: Data = productsInWhisList else { return }
        
        do {
            
            var priductInWhisList: [Product] = try JSONDecoder().decode([Product].self,
                                                                        from: items)
            priductInWhisList.append(product)
            
            let encodedData = try JSONEncoder().encode(priductInWhisList)
            
            dependencies
                .userDefaults
                .set(encodedData, forKey: "WhistList")
        } catch {
            // Failed to encode Contact to Data
        }
    }
}
