//
//  NibBased.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 26.07.24.
//

import UIKit

// MARK: - NibBased

protocol NibBased: AnyObject {
    static var nibName: String { get }
}

extension NibBased where Self: UIView {
    static var nibName: String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    static func instantiate() -> Self {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! Self
    }
}
