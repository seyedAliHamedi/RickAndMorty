//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/3/23.
//

import Foundation

struct RMGetAllEpisodesResponse : Codable {
    let info:Info
    let results : [RMEpisode]
}
