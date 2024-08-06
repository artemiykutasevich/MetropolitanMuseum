//
//  InternetError.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - InternetError

enum InternetError: Error, LocalizedError {
    case noInternetConnection
    case unknown
    case emptyData
    case incorrectJSON
    case incorrectURL
    case serverError(ServerError)
    
    var errorDescription: String? {
        switch self {
        case .noInternetConnection:
            return "no internet connections"
        case .unknown:
            return "unknown error"
        case .emptyData:
            return "empty response data"
        case .incorrectJSON:
            return "incorrect JSON model"
        case .incorrectURL:
            return "incorrect URL request"
        case .serverError(let error):
            return "server error: \(error.name)"
        }
    }
}

// MARK: // MARK: ServerError

extension InternetError {
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
