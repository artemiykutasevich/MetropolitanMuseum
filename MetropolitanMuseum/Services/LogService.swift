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
    
    private static let prefix: String = "📌\t"
    
    static func log(_ message: String) {
        Logger.museum.info("\(prefix)\(message)")
    }
    
    static func debugLog(_ message: String) {
        #if DEBUG
        Logger.museum.debug("\(prefix)\(message)")
        #endif
    }
}

// MARK: - extension Logger

fileprivate extension Logger {
    static let museum = Logger()
}
