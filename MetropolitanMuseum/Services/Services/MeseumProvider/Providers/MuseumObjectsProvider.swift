//
//  MuseumObjectsProvider.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumObjectsProviderProtocol

protocol MuseumObjectsProviderProtocol: AnyObject {
    func getObjects(_ departmentId: Int?, completion: @escaping MuseumObjectsModelResultBlock)
}

// MARK: - MuseumProvider + MuseumObjectsProviderProtocol

extension MuseumProvider: MuseumObjectsProviderProtocol {
    func getObjects(_ departmentId: Int? = nil, completion: @escaping MuseumObjectsModelResultBlock) {
        let string: String = if let departmentId {
            "https://collectionapi.metmuseum.org/public/collection/v1/objects?metadataDate=\(metadataDate)&departmentIds=\(departmentId)"
        } else {
            "https://collectionapi.metmuseum.org/public/collection/v1/objectsmetadataDate=\(metadataDate)"
        }
        
        guard let url = URL(string: string) else {
            return completion(.failure(.incorrectURL))
        }
        
        let request = URLRequest(url: url)
        webService.perform(request: request, completion: completion)
    }
}
