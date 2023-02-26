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
    
    var productsInWhisList: [Product] {
        guard let itemsInWhisList: [Product] = dependencies
            .userDefaults
            .object(forKey: "WhistList") as? [Product] else {
            return []
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
        var items = productsInWhisList
        
        items.append(product)
        
        print("***", items)
        
        dependencies
            .userDefaults
            .set(items, forKey: "myKey")
    }
}
