//
//  APIManager.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 27/05/23.
//

import Foundation
import Combine
import Alamofire


// MARK: - Custom API Manager
struct APIManager {
    
    // MARK: - Change the BASE_URL to the base url of the API
    static let BASE_URL = "http://206.189.88.192:8000"
    
    enum APIError: Error {
        case invalidResponse
        case serverError(code: Int)
    }
    
    
    // MARK: - Using Combine, create an api manager
    static func makeRequest<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders? = nil
    ) -> AnyPublisher<T, APIError> {
        
        // pass to alamofire
        AF.request("\(BASE_URL)/\(url)", method: method, parameters: parameters, headers: headers)
            .publishDecodable(type: T.self)
        // Trymap. if we throw something here, it will be catched at mapError
            .tryMap { element -> T in
                switch element.result {
                case .success(let value):
                    return value
                case .failure:
                    guard let statusCode = element.response?.statusCode else {
                        throw APIError.invalidResponse
                    }
                    
                    debugPrint(element.result)
                    debugPrint(element.response as Any)
                    
                    if let data = element.data, let str = String(data: data, encoding: .utf8) {
                        debugPrint("Server Response: \(str)")
                    }
                    
                    throw APIError.serverError(code: statusCode)
                }
            }
        // check if there's error, if yes throw an invalid response
            .mapError { $0 as? APIError ?? .invalidResponse }
            .eraseToAnyPublisher()
    }
    
    
}
