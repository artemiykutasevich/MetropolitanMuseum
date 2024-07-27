//
//  HomeViewController.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import UIKit

// MARK: - HomeViewProtocol

protocol HomeViewProtocol: AnyObject {
    var collectionView: UICollectionView! { get set }
}

// MARK: - HomeViewController

final class HomeViewController: UIViewController, HomeViewProtocol {
    
    // @IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Properties
    
    var presenter: HomePresenterProtocol!
    
    // override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        presenter.configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogService.debugLog("👀\t\(className): viewed")
    }
    
    // Functions
    
    private func configureOutlets() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(PlaceholderCollectionViewCell.self)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PlaceholderCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - Defaults.sectionEdgeInsert.left - Defaults.sectionEdgeInsert.right - (Defaults.spaceBetweenItems * (Defaults.itemsInRow - 1).toCGFloat())) / Defaults.itemsInRow.toCGFloat()
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Defaults.spaceBetweenItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Defaults.sectionEdgeInsert
    }
}

// MARK: - Defaults

fileprivate extension HomeViewController {
    enum Defaults {
        static let itemsInRow: Int = 3
        static let spaceBetweenItems: CGFloat = 10.0
        static let sectionEdgeInsert: UIEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
