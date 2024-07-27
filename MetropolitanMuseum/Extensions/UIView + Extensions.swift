//
//  UIView + Extensions.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import UIKit

// MARK: - @IBDesignable UIView

@IBDesignable
extension UIView: BaseClass {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerCurve = .circular
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable
    var continuesCornerRadius: CGFloat {
        set {
            layer.cornerCurve = .continuous
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.cornerRadius
        }
    }
}
