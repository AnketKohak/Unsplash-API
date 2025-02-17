//
//  SearchObjectController.swift
//  Unsplash API
//
//  Created by Anket Kohak on 17/02/25.
//

import Foundation


class SearchObjectController: ObservableObject{
    static let shared = SearchObjectController()
    private init(){}
    @Published var results = [Result]()
    @Published var searchText: String = "flower"
    var token = "knLgWPCE0eOYLvyzoFKj0WriP5AdVWoUVcC7xXhwauA"
    func search(){
        let url = URL(string: "https://api.unsplash.com/search/photos?query=\(searchText)")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("Client-ID \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
            guard let data = data else { return}
            do {
                let res = try JSONDecoder().decode(Results.self, from: data)
                self.results.append(contentsOf: res.results)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
