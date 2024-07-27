//
//  MuseumProvider.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumProviderProtocol

protocol MuseumProviderProtocol: MuseumObjectProviderProtocol, MuseumObjectsProviderProtocol {}

// MARK: - MuseumProvider

final class MuseumProvider: MuseumProviderProtocol {
    lazy var webService: WebServiceProtocol = serviceLocator.getService()
}
