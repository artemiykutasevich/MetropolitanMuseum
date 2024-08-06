//
//  ReusableView.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 26.07.24.
//

import UIKit

// MARK: - ReusableView

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
