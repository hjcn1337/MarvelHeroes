//
//  CharactersApi.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 19.02.2021.
//

import Foundation
import Alamofire
import RxSwift


final class CharactersApi {
    
    //var characters = CharactersViewModel(cells: [])
    
    //func getCharacters(completion: @escaping (CharactersViewModel) -> ()) {
    func getCharacters() -> Observable<CharactersResponse<Character>> {
    
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?ts=thesoer&apikey=f624424cb4b39d5db3ea6d9ef4b728ac&hash=a68bb3d6b49a535dc6c64497b19da48d")
        let request = URLRequest(url: url!)
        
//        AF.request(request).validate().responseDecodable(of: CharactersResponse<Character>.self) { (response) in
//            guard let characters = response.value else { return }
//            for ch in characters.data.results {
//                print(ch.name)
//            }
//        }
        
        let ch = AF.request(request).rx.responseJSON()
            .map { $0
            }
            //.subscribe(onNext: { print("Origin:", $0[1].name) })
        return ch
    }
}
