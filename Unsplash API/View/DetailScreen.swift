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
                        .aspectRatio(3/2, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        .overlay (
                            HStack{
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(.red)
                                    .font(.largeTitle)
                                
                                Text("\(result.likes ?? 0)")
                                    .font(.largeTitle)
                                
                                
                            }.padding(10),
                            alignment: .bottomTrailing
                        ) }placeholder: {
                    VStack {
                        Spacer()
                        ProgressView("Loading...")
                            .font(.largeTitle)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            Text(result.description ?? "")
                .font(.title2)
            Spacer()
            
        }.padding()
    }
}
