//
//  HomeCollectionViewCell.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 2.08.24.
//

import UIKit
import Kingfisher

// MARK: - HomeCollectionViewCell

class HomeCollectionViewCell: BaseCollectionViewCell {
    
    // IBOutlets
    
    @IBOutlet private weak var progressImageView: UIImageView!
    @IBOutlet private weak var imageView: UIImageView!
    
    // override
    
    override func prepareForReuse() {
        super.prepareForReuse()
        progressImageView.image = nil
        imageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .secondarySystemFill
        contentView.continuesCornerRadius = Defaults.cornerRadius
    }
    
    // Functions
    
    func configure(with model: MuseumObjectModel) {
        let url = URL(string: model.primaryImageSmall)
        KF.url(url)
            .fade(duration: Constants.UI.animationDuration)
            .onSuccess({ [weak self] result in
                guard let self else { return }
                progressImageView.isHidden = true
            })
            .onFailure({ [weak self] result in
                guard let self else { return }
                progressImageView.image = Constants.UI.errorImage
                progressImageView.isHidden = false
            })
            .set(to: imageView)
    }
    
    func configureEmpty() {
        progressImageView.image = Constants.UI.placeholderImage
        progressImageView.isHidden = false
        imageView.image = nil
    }
}

// MARK: - Defaults

fileprivate extension HomeCollectionViewCell {
    enum Defaults {
        static let cornerRadius: CGFloat = 16.0
    }
}
