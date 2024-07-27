//
//  MuseumObjectProvider.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumObjectProviderProtocol

protocol MuseumObjectProviderProtocol: AnyObject {
    func getObject(id: String, completion: @escaping MuseumObjectModelResultBlock)
}

// MARK: - MuseumProvider + MuseumObjectProviderProtocol

extension MuseumProvider: MuseumObjectProviderProtocol {
    func getObject(id: String, completion: @escaping MuseumObjectModelResultBlock) {
        let string = "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(id)"
        guard let url = URL(string: string) else {
            return completion(.failure(.incorrectURL))
        }
        
        let request = URLRequest(url: url)
        webService.perform(request: request, completion: completion)
    }
}
