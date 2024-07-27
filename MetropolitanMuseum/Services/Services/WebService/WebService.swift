//
//  WebService.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - WebServiceProtocol

protocol WebServiceProtocol: AnyObject {
    var connectionIsAvailable: Bool { get }
    
    func perform<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, InternetError>) -> Void)
}

// MARK: - WebService

final class WebService: BaseClass {
    private let serviceQueue: OperationQueue
    private let serviceSession: URLSession
    
    private let decoder = JSONDecoder()
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 180
        configuration.httpMaximumConnectionsPerHost = 10
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        
        serviceQueue = OperationQueue()
        serviceQueue.maxConcurrentOperationCount = 1 // по одному запросу за раз
        serviceSession = URLSession(configuration: configuration, delegate: nil, delegateQueue: serviceQueue)
    }
}

// MARK: WebServiceProtocol

extension WebService: WebServiceProtocol {
    var connectionIsAvailable: Bool {
        Reachability.isConnectedToNetwork()
    }
    
    func perform<T: Decodable>(request: URLRequest, completion: @escaping (Result<T, InternetError>) -> Void) {
        guard connectionIsAvailable else { return completion(.failure(.noInternetConnection)) }
        
        LogService.debugLog("🏳️\t\(className): URL \(String(describing: request.url))", prefix: .web)
        
        serviceSession.dataTask(with: request) { [weak self] (data, response, error) -> Void in
            guard let self else { return completion(.failure(.unknown)) }
            handleResponse(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
}

extension WebService {
    func handleResponse<T: Decodable>(data: Data?, response: URLResponse?, error: Error?, completion: @escaping (Result<T, InternetError>) -> Void) {
        guard let data, let response else { return completion(.failure(.emptyData)) }
        
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
        
        DispatchQueue.main.async {
            switch statusCode {
            case 200...299:
                if let parsedData = try? self.decoder.decode(T.self, from: data) {
                    LogService.debugLog("✅\t\(self.className): parse in: \(T.Type.self) - \(T.self) success", prefix: .web)
                    completion(.success(parsedData))
                } else {
                    LogService.debugLog("⛔️\t\(self.className): parse in: \(T.Type.self) - \(T.self) failure", prefix: .web)
                    completion(.failure(.incorrectJSON))
                }
            case 400...499:
                if let serverError = InternetError.ServerError(rawValue: statusCode) {
                    LogService.debugLog("⛔️\t\(self.className): \(serverError.name)", prefix: .web)
                    completion(.failure(.serverError(serverError)))
                } else {
                    let serverError = InternetError.ServerError.unknown
                    LogService.debugLog("⛔️\t\(self.className): \(serverError.name)", prefix: .web)
                    completion(.failure(.serverError(serverError)))
                }
            default:
                LogService.debugLog("⛔️\t\(self.className): unknown error with statusCode \(statusCode)", prefix: .web)
                completion(.failure(.unknown))
            }
        }
    }
}
