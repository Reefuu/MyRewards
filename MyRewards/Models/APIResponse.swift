//
//  APIResponse.swift
//  MyRewards
//
//  Created by MacBook Pro on 27/05/23.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
    var success: Bool
    var data: T
    var message: String
}
