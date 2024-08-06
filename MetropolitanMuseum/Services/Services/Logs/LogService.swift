//
//  LogService.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import OSLog

// MARK: - LogService

final class LogService {
    private init() {}
    
    static func log(_ message: String, prefix: Prefix = .default) {
        Logger.museum.info("\(prefix.icon)\t\(message)")
    }
    
    static func debugLog(_ message: String, prefix: Prefix = .default) {
        #if DEBUG
        Logger.museum.debug("\(prefix.icon)\t\(message)")
        #endif
    }
}

// MARK: Prefix

extension LogService {
    enum Prefix {
        case success
        case failure
        case web
        case viewed
        case result
        case `default`
        
        var icon: String {
            switch self {
            case .web:
                return "🌐"
            case .viewed:
                return "👀"
            case .default:
                return "📌"
            case .success:
                return "✅"
            case .failure:
                return "⛔️"
            case .result:
                return "ℹ️"
            }
        }
    }
}

// MARK: - extension Logger

fileprivate extension Logger {
    static let museum = Logger()
}
