//
//  Result.swift
//  Unsplash API
//
//  Created by Anket Kohak on 17/02/25.
//

import Foundation

struct Results:Codable{
    let total: Int
    let results:[Result]
}
struct Result:Codable{
    let id:String
    let description:String?
    let urls: URLs
}

struct URLs:Codable{
    let small:String?
    let medium:String?
}
