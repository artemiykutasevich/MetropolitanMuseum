//
//  UIViewController + Extensions.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import UIKit

// MARK: - UIViewController

extension UIViewController {
    
    var className: String {
        return String(describing: Self.self)
    }
    
    static func loadFromStoryboard<T>(storyboardName: String? = nil, viewControllerName: String? = nil, bundle: Bundle? = nil) -> T? {
        let storyboard = UIStoryboard(name: storyboardName ?? String(describing: self), bundle: bundle)
        return storyboard.instantiateViewController(identifier: viewControllerName ?? String(describing: self)) as? T
    }
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
}
