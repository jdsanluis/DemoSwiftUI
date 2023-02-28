//
//  DeleteProductFromWhistListAPI.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 27/02/23.
//

import Foundation

protocol DeleteProductFromWhistListAPI {
    func invoke(product: Product, completion: @escaping((Bool) -> ()))
}

final class DeleteProductFromWhistListAPIImp {
    
    struct Dependencies {
        let userDefaults = UserDefaults.standard
    }
    
    let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension DeleteProductFromWhistListAPIImp: DeleteProductFromWhistListAPI {
    
    func invoke(product: Product, completion: @escaping((Bool) -> ())) {
        let whisListKey = UserDefaults.Keys.myKey
        var itemsInWhisList: [Product] = []
        
        if let savedData = dependencies
            .userDefaults
            .object(forKey: whisListKey) as? Data {

            do{
                itemsInWhisList = try JSONDecoder().decode([Product].self,
                                                             from: savedData)

            } catch {
                print("Error info: \(error)")
                completion(false)
            }
        }
        
        itemsInWhisList.removeAll(where: { $0.id == product.id })
        
        do {
            let encodedData = try JSONEncoder().encode(itemsInWhisList)
            
            dependencies
                .userDefaults
                .set(encodedData, forKey: whisListKey)
            completion(true)
        } catch {
            completion(false)
        }
    }
}
