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
            NavigationLink {
                DetailScreen(result: result)
            } label: {
                if let urlImage = result.urls.small{
                    let url = URL(string: urlImage)
                    AsyncImage(url: url) { image in
                        image.resizable()
                            .scaledToFit()
                            .aspectRatio(2/3, contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0))
                    } placeholder: {
                        VStack {
                            Spacer()
                            ProgressView() // Fixed the typo
                                .scaleEffect(2)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures full centering
                    }
                }
            }
        }.listStyle(.plain)
            .onAppear(){
                searchObjectContoller.search()
            }
    }
}

#Preview {
    ContentView()
}

struct DetailScreen: View{
    let result: Result
    var body: some View{
        VStack{
            if let urlImage = result.urls.small{
                let url = URL(string: urlImage)
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                        .aspectRatio(2/3, contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                } placeholder: {
                    VStack {
                        Spacer()
                        ProgressView("Loading...") // Fixed the typo
                            .font(.largeTitle) // Works fine here
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensures full centering
                }
            }
            Text(result.description ?? "")
        }
    }
}
