//
//  UICollectionView + Extensions.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 26.07.24.
//

import UIKit

// MARK: - UICollectionView

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibBased {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerClass<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibBased {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            assert(false, "Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
            fatalError()
        }
        return cell
    }
}
