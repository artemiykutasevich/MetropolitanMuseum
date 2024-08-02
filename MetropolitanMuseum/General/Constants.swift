//
//  Constants.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 2.08.24.
//

import UIKit

// MARK: - Constants

final class Constants {
    private init() {}
    
    // MARK: UI
    
    enum UI {
        static let animationDuration: TimeInterval = 0.25
        
        static let placeholderImage: UIImage? = UIImage(systemName: "arrow.down.circle")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 10))
            .withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
        
        static let errorImage: UIImage? = UIImage(systemName: "photo")?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 10))
            .withTintColor(.red.withAlphaComponent(0.7), renderingMode: .alwaysOriginal)
    }
}
