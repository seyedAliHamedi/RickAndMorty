//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import UIKit

final class RMCharacterListViewModel   {
    
    func fetchAllCharaters(){
        //let request = RMRequest(endPoint: .character,queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])
        RMService.shared.execute(.chatacterListRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let res):
                print(String(describing: res))
                print("Total: "+String(res.info.count))
            case .failure(let err):
                print(String(describing: err))
            }
        }
        
    }
}

