//
//  DetailScreen.swift
//  Unsplash API
//
//  Created by Anket Kohak on 18/02/25.
//

import Foundation
import SwiftUI
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
        }.padding()
    }
}
