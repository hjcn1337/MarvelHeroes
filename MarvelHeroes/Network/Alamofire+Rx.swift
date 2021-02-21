//
//  BaseApi.swift
//  MarvelHeroes
//
//  Created by Ростислав Ермаченков on 19.02.2021.
//

import Alamofire
import RxSwift

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {

    func responseJSON() -> Observable<CharactersResponse<Character>> {
        return Observable.create { observer in
            let request = self.base.responseDecodable(of: CharactersResponse<Character>.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()

                case .failure(let error):
                    observer.onError(error)
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
