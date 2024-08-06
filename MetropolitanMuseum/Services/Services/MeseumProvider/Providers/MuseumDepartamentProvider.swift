//
//  MuseumDepartamentProvider.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumDepartamentProviderProtocol

protocol MuseumDepartamentProviderProtocol: AnyObject {
    func getDepartments(completion: @escaping MuseumDepartmentsResultBlock)
}

// MARK: - MuseumProvider + MuseumDepartamentProviderProtocol

extension MuseumProvider: MuseumDepartamentProviderProtocol {
    func getDepartments(completion: @escaping MuseumDepartmentsResultBlock) {
        let string = "https://collectionapi.metmuseum.org/public/collection/v1/departments"
        guard let url = URL(string: string) else {
            return completion(.failure(.incorrectURL))
        }
        
        let request = URLRequest(url: url)
        webService.perform(request: request, completion: completion)
    }
}
