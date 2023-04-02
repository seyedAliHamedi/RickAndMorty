//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by seyedali hamedi on 4/2/23.
//

import Foundation

/// Object that represents a single API Call
final class RMRequest{
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endPoint : RMEndPoint
    /// Path Components for API , if any
    private let pathComponents : Set<String>
    /// Query Parameters for API , if any
    private let queryParameters : [URLQueryItem]
    
    /// Constructed url for API request in string formatt
    private var urlString :String {
        var string = Constants.baseUrl
        
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({ string += "/\($0)"})
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            queryParameters.forEach({
                string += "\($0.name)=\(String(describing: $0.value!))&"
            })
        }
        if string.last == "&" {
            string = String(string.prefix(string.count-1))
        }
        return string
    }
    
    /// Computed & constructed API url
    public var url:URL? {
        return URL(string: urlString)
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endPoint: target endpoint
    ///   - pathComponents: collection of Path components
    ///   - queryParameters: collection of Query Parameters
    public init(endPoint: RMEndPoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    

    
}
