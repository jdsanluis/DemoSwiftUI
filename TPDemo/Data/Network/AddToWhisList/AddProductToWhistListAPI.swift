//
//  DataController.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

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
        var productsToAdd: [Product] = []
//        guard var items: Data = productsInWhisList else {
//            do {
//                productsToAdd.append(product)
//                let encodedData = try JSONEncoder().encode(productsToAdd)
//
//                dependencies
//                    .userDefaults
//                    .set(encodedData, forKey: "WhistList")
//            } catch {
//
//            }
//            return
//        }
//
//        if let savedData = dependencies.userDefaults.object(forKey: "WhistList") as? Data {
//            do {
//
//                let savedContacts = try JSONDecoder().decode([Product].self, from: savedData)
////                productsToAdd = try JSONDecoder().decode([Product].self, from: items)
////                productsToAdd.append(product)
//                let encodedData = try JSONEncoder().encode(savedContacts)
//
//                dependencies
//                    .userDefaults
//                    .set(encodedData, forKey: "WhistList")
//            } catch {
//                // Failed to encode Contact to Data
//                print("Error info: \(error)")
//            }
//        }
        
        let whisListKey = UserDefaults.Keys.myKey
        if !dependencies.userDefaults.valueExists(forKey: whisListKey) {
            do {
                productsToAdd.append(product)
                let encodedData = try JSONEncoder().encode(productsToAdd)
                
                dependencies
                    .userDefaults
                    .set(encodedData, forKey: whisListKey)
            } catch {
               print(error)
            }
        } else {
            if let data = UserDefaults.standard.data(forKey: whisListKey) {
                do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                    let notes = try decoder.decode([Product].self, from: data)
                    
                    productsToAdd = notes
                    productsToAdd.append(product)
                    
                    let encodedData = try JSONEncoder().encode(productsToAdd)
                    
                    dependencies
                        .userDefaults
                        .set(encodedData, forKey: whisListKey)

                } catch {
                    print(error)
                }
            }
        }
    }
}
