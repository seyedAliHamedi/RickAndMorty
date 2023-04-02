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
    
    enum RMServiceError : Error {
        case failedToCreateRequest
        case failedToGetData
        case failedToParseData
    }
    
    
    
    
    
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: Type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T:Codable>(
        _ request : RMRequest,
        expecting type : T.Type,
        completion : @escaping (Result<T,Error>)-> Void
    ){
        /// Configure our requst using the ' request ' private function and the RMRequest object
        guard let req = self.request(from: request) else {
            /// Error Handling
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        /// Initilizing a URLSession Task to send the request
        let task = URLSession.shared.dataTask(with: req) { data, _ , err in
            
            /// Get the data , if any & there is no error
            guard let data = data , err == nil  else{
                /// Custom Error handling & using the error from the sever , if any
                completion(.failure(err ?? RMServiceError.failedToGetData))
                return
            }
            
            /// Extracting the data
            do {
                /// Decode the json response by the data from the server and the type wich is specified when calling this function
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch  {
                /// Error Handling
                completion(.failure(err ?? RMServiceError.failedToParseData))
            }
            
            
        }
        task.resume()
    }
    
    
    // MARK: - Private
    private func request(from rmRequest:RMRequest) -> URLRequest?{
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
    
}
