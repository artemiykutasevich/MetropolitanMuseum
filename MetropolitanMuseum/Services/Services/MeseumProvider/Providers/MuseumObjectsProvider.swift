//
//  MuseumObjectsProvider.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumObjectsProviderProtocol

protocol MuseumObjectsProviderProtocol: AnyObject {
    func getObjects(completion: @escaping MuseumObjectsModelResultBlock)
}

// MARK: - MuseumProvider + MuseumObjectsProviderProtocol

extension MuseumProvider: MuseumObjectsProviderProtocol {
    func getObjects(completion: @escaping MuseumObjectsModelResultBlock) {
        let string = "https://collectionapi.metmuseum.org/public/collection/v1/objects"
        guard let url = URL(string: string) else {
            return completion(.failure(.incorrectURL))
        }
        
        let request = URLRequest(url: url)
        webService.perform(request: request, completion: completion)
    }
}
