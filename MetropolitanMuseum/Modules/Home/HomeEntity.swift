//
//  HomeEntity.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

protocol HomeEntityProtocol: AnyObject {
    var models: [MuseumObjectModel] { get set }
}

final class HomeEntity: HomeEntityProtocol {
    var models: [MuseumObjectModel] = []
}
