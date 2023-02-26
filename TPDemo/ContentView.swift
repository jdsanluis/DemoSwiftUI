//
//  ContentView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductsListView()
                .tabItem {
                    Label("Productos", systemImage: "list.dash")
                }
                .tag(0)
            
            FavoritesListView()
                .tabItem {
                    Label("Wish List", systemImage: "heart")
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
