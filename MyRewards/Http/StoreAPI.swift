//
//  StoreAPI.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 27/05/23.
//

import Foundation
import Alamofire
import SwiftyJSON
import Combine

struct StoreAPI {
    // MARK: - Get Working store (for Workers) API Endpoint
    static func getWorkingStore(token: String) -> AnyPublisher<APIResponse<[Store]>, APIManager.APIError> {
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/stores",
            headers: headers
        )
    }
    
    // MARK: - Redeem coupon (for Workers) API Endpoint
    static func redeemCoupon(code: String, token: String) -> AnyPublisher<APIResponse<JSON>, APIManager.APIError> {
        
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        return APIManager.makeRequest(
            url: "api/my/coupon/redeem",
            method: .post,
            parameters: [
                "code": code
            ],
            headers: headers
        )
    }
}
