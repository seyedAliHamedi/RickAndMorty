//
//  RMResponseInfo.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import Foundation
struct Info :Codable {
    let count : Int
    let pages : Int
    let next : String?
    let prev : String?
}
