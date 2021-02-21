//
//  CharactersResponse.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 19.02.2021.
//

import Foundation

struct CharactersResponse<T: Codable>: Codable {
    let data: CharactersResults<T>
}
struct CharactersResults<T: Codable>: Codable {
    let results: [T]
}

struct Character: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    struct Thumbnail: Codable {
        let path: String
        let `extension`: String
        
        var urlString: String {
            return path + "." + `extension`
        }
    }
    
}
