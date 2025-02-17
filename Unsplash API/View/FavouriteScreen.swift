//
//  FavouriteScreen.swift
//  Unsplash API
//
//  Created by Anket Kohak on 18/02/25.
//

import Foundation
import SwiftUI



struct FavouriteScreen: View{
    let result: [Result]
    var body: some View{
        List(result, id:\.id){ result in
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
                            ProgressView("Loading...")
                                .font(.largeTitle)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
            }.padding()
        }
    }
}
