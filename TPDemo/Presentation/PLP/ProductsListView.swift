//
//  ProductsListView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct ProductsListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
//    @State private var toast: FancyToast? = nil
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            NavigationStack(){
                ScrollView{
                    Spacer().frame(height: 10)
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach($viewModel.products, id: \.self) { product in
                            ProductListCellView(product: product.wrappedValue)
                                .environmentObject(viewModel)
                        }
                    }
                }
                .navigationTitle(Text("Fake Store"))
                .toolbarBackground(Color.pink,
                                   for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }.onAppear {
//                viewModel.getProducts()
                setup()
            }
        }.toastView(toast: $viewModel.toast)
    }
    
    private func setup() {
        viewModel.getProducts()
//        toast = FancyToast(type: .info,
//                           title: "Toast info",
//                           message: "Toast message")
    }
}

extension View {
    func toastView(toast: Binding<FancyToast?>) -> some View {
        self.modifier(FancyToastModifier(toast: toast))
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView()
            .environmentObject(ProductListViewModel())
    }
}
