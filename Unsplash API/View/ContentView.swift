//
//  ContentView.swift
//  Unsplash API
//
//  Created by Anket Kohak on 17/02/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var searchObjectContoller = SearchObjectController()
    var body: some View {
        List(searchObjectContoller.results , id: \.id ){ result in
            Text(result.description ?? "Empty")
        }.onAppear(){
            searchObjectContoller.search()
        }
    }
}

#Preview {
    ContentView()
}
