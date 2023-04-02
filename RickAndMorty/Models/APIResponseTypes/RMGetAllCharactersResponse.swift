//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import Foundation

struct RMGetAllCharactersResponse : Codable {
    let info:Info
    let results : [RMCharacter]
}
