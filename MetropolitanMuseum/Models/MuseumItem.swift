//
//  MuseumItem.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 30.07.24.
//

import Foundation

// MARK: - MuseumItem

struct MuseumItem {
    let department: Department
    let objects: [MuseumObjectModel]
    
    // MARK: Department
    
    struct Department {
        let id: Int
        let name: String
    }
}
