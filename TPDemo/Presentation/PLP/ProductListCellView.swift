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
                        Spacer()
                            .frame(height: 25)
                        Image(systemName: "plus")
                            .frame(width: 25, height: 25)
                        Image(systemName: "minus")
                            .frame(width: 25, height: 25)
                        Image(systemName: "square.and.arrow.up")
                            .frame(width: 25, height: 25)
                        Spacer()
                    }

                    Spacer()
                    HStack {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .scaledToFit()
                    }
                    VStack(spacing: 15) {
                        Spacer()
                            .frame(height: 10)
                        Image(systemName: product.isInWhisList ? "suit.heart.fill" : "suit.heart")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.red)
                            .gesture(
                                TapGesture()
                                    .onEnded({
                                        makeInput(product)
                                    })
                            )
                        Spacer()
                    }
                }
            }
            
            VStack(spacing: 5 ) {
                Text(product.description)
                    .frame(maxWidth: .infinity)
                    .lineLimit(2)

                HStack {
                    Text("$"+product.price.description)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                    
                    HStack {
                        Text("4.1 *")
                            .frame(maxWidth: .infinity,
                                   alignment: .trailing)

                        Image(systemName: "star.fill")
                            .frame(width: 15, height: 15)
                    }
                    
                }
            }
        }
        .frame(width: 185, height: 240)
        .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(8)
                    .shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    )
            )
    }
    
    
    private func makeInput(_ product: Product) {
        if product.isInWhisList {
            viewModel.deleteProductToWhistList(product)
        } else {
            var productAux = product
            productAux.isInWhisList = !product.isInWhisList
            viewModel.addProductToWhistList(product)
        }
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
