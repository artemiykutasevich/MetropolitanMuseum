//
//  InternetError.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - InternetError

enum InternetError: Error {
    case noInternetConnection
    case unknown
    case emptyData
    case incorrectJSON
    case incorrectURL
    
    case serverError(ServerError)
    
    enum ServerError: Int {
        case unknown = 0
        case badRequest = 400     // 400
        case authorization = 401  // 401
        
        var name: String {
            switch self {
            case .unknown:
                return "unknown error"
            case .badRequest:
                return "bad request"
            case .authorization:
                return "authorization failure"
            }
        }
    }
}
