//
//  Result.swift
//  Unsplash API
//
//  Created by Anket Kohak on 17/02/25.
//

import Foundation

struct Results:Codable{
    var total: Int
    var results:[Result]
}
struct Result:Codable{
    var id:String
    var description:String?
    var urls: URLs
}

struct URLs:Codable{
    var small:String
}
