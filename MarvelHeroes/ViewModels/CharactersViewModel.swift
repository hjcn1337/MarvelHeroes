//
//  CharactersViewModel.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 21.02.2021.
//

import Foundation
import RxSwift
import RxCocoa

class CharactersViewModel {
    
    private let networkManager = CharactersApi()
    private let disposeBag = DisposeBag()
    
    private var charactersObservable: Observable<CharactersResponse<Character>> = Observable.empty()
    
    var characters: Observable<[CharacterModel]> = Observable.empty()
    
    var searchText = BehaviorRelay<String>(value: "")
    
    init() {
//        charactersObservable = searchText.asObservable()
//            .flatMapLatest { [unowned self] searchString -> Observable<CharactersResponse<Character>> in
//
////                guard !searchString.isEmpty else {
////                    //return Observable.empty()
////                    return self.networkManager.getCharacters()
////                }
////
////                return Observable.empty()
//
//                return self.networkManager.getCharacters()
//            }
//            .share()
        
        charactersObservable = self.networkManager.getCharacters()
        
        characters = charactersObservable
            .map {
                var chsArray = [CharacterModel]()
                for ch in $0.data.results {
                    chsArray.append(CharacterModel(name: ch.name, description: ch.description, imageUrlString: ch.thumbnail.urlString))
                }
                return chsArray
            }
    }
}
