//
//  ProductResponseModel.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 26/02/23.
//

import Foundation

struct ProductResponseModel: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: RatingResponseModel
}

struct RatingResponseModel: Codable {
    let rate: Double
    let count: Int
}

extension ProductResponseModel {
    
    func mapToProduct() -> Product {
        .init(id: id,
              name: title,
              price: price,
              image: image,
              rating: rating.rate,
              description: description,
              isInWhisList: false)
    }
}
