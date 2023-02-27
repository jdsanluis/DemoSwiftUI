//
//  ProductListCellView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct ProductListCellView: View {
    
    @EnvironmentObject var viewModel: ProductListViewModel
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(spacing: 15) {
                        Image(systemName: "plus")
                            .frame(width: 25, height: 25)
                        Image(systemName: "minus")
                            .frame(width: 25, height: 25)
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 25, height: 25)
                        Spacer()
                    }
                    .border(.gray)
                    
                    Image("wrongItem")
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Image(systemName: "suit.heart")
                                .font(.title3)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .foregroundColor(.red)
                                .gesture(
                                    TapGesture()
                                        .onEnded({
                                            viewModel
                                                .addProductToWhistList(product)
                                        })
                                )
                        }
                }
                .border(.green)
            }
            .border(.black)
            
            VStack(spacing: 5 ) {
                Text(product.description)
                    .frame(maxWidth: .infinity)
                    .border(.green)
                HStack {
                    Text("$"+product.price.description)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                        .border(.pink)
                    
                    HStack {
                        Text("4.1 *")
                            .frame(maxWidth: .infinity,
                                   alignment: .trailing)
                            .border(.blue)
                        Image(systemName: "star.fill")
                            .frame(width: 15, height: 15)
                    }
                    
                }
                .border(.red)
            }
            .border(.red)
        }
        .frame(width: 185, height: 240)
        .border(.yellow)
    }
    
}

struct ProductListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let product: Product = .init(id: 0,
                                     name: "xxx",
                                     price: 12.4,
                                     image: "image",
                                     rating: 5.3,
                                     description: "description",
                                     isInWhisList: true)
        
        ProductListCellView(product: product)
    }
}
