//
//  RMCharecterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import Foundation

final class RMCharecterCollectionViewCellViewModel {
    
    public let characterName: String
    private let characterStatus: RMCharacterStatus
    private let characterGender: RMCharacterGender
    private let characterImageUrl: URL?

    init(characterName: String, characterStatus: RMCharacterStatus, characterGender: RMCharacterGender, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterGender = characterGender
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterInfoText:String {
        return "Gender :" + characterGender.rawValue + "\nStatus: " + characterStatus.rawValue
    }
    
    public func fetchImage(completion:@escaping (Result<Data,Error>) -> Void) {
        
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, err in
            guard let data = data , err == nil else{
                completion(.failure(err ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
}
