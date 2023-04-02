//
//  RMEndPoint.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/2/23.
//

import Foundation

/// Represnts unique API Endpoins
@frozen enum RMEndPoint : String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location data
    case location
    /// Endpoint to get episode info
    case episode
    
}
