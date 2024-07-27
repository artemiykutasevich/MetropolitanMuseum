//
//  BaseClass.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import Foundation

protocol BaseClass {
    var className: String { get }
}

extension BaseClass {
    var className: String {
        return String(describing: Self.self)
    }
}
