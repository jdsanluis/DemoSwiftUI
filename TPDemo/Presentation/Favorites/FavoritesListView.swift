//
//  FavoritesListView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 25/02/23.
//

import SwiftUI

struct FavoritesListView: View {
    
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        NavigationStack(){
            List(viewModel.products) { product in
                FavoriteListCellView(product: product)
            }.navigationTitle(Text("Whis List"))
        }.onAppear {
            viewModel.getWhisList()
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}
