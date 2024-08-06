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
            .withTintColor(.secondaryLabel, renderingMode: .alwaysOriginal)
        
        static let errorImage: UIImage? = UIImage(systemName: "photo")?
            .withTintColor(.systemRed.withAlphaComponent(0.7), renderingMode: .alwaysOriginal)
        
        static let highlightedItemImage: UIImage? = UIImage(systemName: "star.fill")?
            .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
        
        static let unhighlightedItemImage: UIImage? = UIImage(systemName: "star")?
            .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    }
}
