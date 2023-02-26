//
//  Product.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import Foundation

struct Product: Identifiable, Hashable, Codable {

    var id: Int
    let name: String
    let price: Double
    let image: String
    let rating: Double
    let description: String
}
