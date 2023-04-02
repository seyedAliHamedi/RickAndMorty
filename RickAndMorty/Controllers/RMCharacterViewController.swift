//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/2/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        
//
//        let request = RMRequest(endPoint: .character,queryParameters: [URLQueryItem(name: "name", value: "rick"),URLQueryItem(name: "status", value: "alive")])
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
