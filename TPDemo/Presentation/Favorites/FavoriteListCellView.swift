//
//  FavoriteListCellView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct FavoriteListCellView: View {
    
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        HStack{
            VStack {
                Image("wrongItem")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(width: 100)
            .padding()
            .border(.red)
            
            VStack{
                Text(product.description)
                    .frame(alignment: .leading)
                Spacer()
                HStack {
                    Text("S"+product.price.description)
                        .frame(alignment: .leading)
                    Spacer()
                }
            }
        }
        .frame(height: 140)
        .border(.green)
    }
}

struct FavoriteListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let product: Product = .init(name: "xxx",
                                     price: 12.4,
                                     image: "image",
                                     rating: 5.3,
                                     description: "description")
        
        FavoriteListCellView(product: product)
    }
}
