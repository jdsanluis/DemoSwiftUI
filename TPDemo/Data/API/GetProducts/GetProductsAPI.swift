//
//  GetProductsAPI.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

protocol GetProductsAPI {
    func invoke(completion: @escaping (([ProductResponseModel]) -> ()))
}

final class GetProductsAPIImp: GetProductsAPI {
    
    func invoke(completion: @escaping (([ProductResponseModel]) -> ())) {
        var request = URLRequest(url: URL(string: "https://fakestoreapi.com/products")!,
                                 timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            let books = try? JSONDecoder().decode([ProductResponseModel].self, from: data)
            
            DispatchQueue.main.async {
                completion(books ?? [])
            }
        }
        
        task.resume()
    }
}
