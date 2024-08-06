//
//  MuseumObjectsModel.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumObjectsModel

struct MuseumObjectsModel: Decodable {
    let total: Int
    let objectIDs: [Int]
}
