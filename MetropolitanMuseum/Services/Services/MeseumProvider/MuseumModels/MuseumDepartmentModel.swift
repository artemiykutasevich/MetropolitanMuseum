//
//  MuseumDepartamentModel.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

// MARK: - MuseumDepartamentModel

struct MuseumDepartmentModel: Decodable {
    let departments: [MuseumDepartamentItemModel]
    
    // MARK: MuseumDepartamentItemModel
    
    struct MuseumDepartamentItemModel: Decodable {
        let departmentId: Int
        let displayName: String
    }
}
