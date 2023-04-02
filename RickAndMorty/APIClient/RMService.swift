//
//  RMService.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/2/23.
//

import Foundation

/// Primary API Service object to get Rick and Morty data
final class RMService {
    /// Shared singelton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init(){}
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request : RMRequest, completion : @escaping ()-> Void){}
    
    
}
