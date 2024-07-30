//
//  HomeHeaderReusableView.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 27.07.24.
//

import UIKit

// MARK: - HomeHeaderReusableView

class HomeHeaderReusableView: BaseCollectionReusableView {
    
    // @IBOutlets
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // override
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
    // Functions
    
    func configure(titleText: String) {
        titleLabel.text = titleText
    }
}
