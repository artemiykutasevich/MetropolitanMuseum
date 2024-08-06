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
    
    private lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
            guard let self else { return nil }
            
            // Items
            
            let cellWidth: CGFloat = (collectionView.frame.width - Defaults.sectionLeftInsert - Defaults.sectionRightInsert - (Defaults.spaceBetweenItems * (Defaults.itemsInRow - 1).toCGFloat())) / Defaults.itemsInRow.toCGFloat()
            let cellHeight: CGFloat = cellWidth
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth),
                heightDimension: .absolute(cellHeight)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Group
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .absolute(cellWidth),
                heightDimension: .absolute(cellHeight)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitems: [item]
            )
            
            group.interItemSpacing = .fixed(Defaults.spaceBetweenItems)
            
            // Header
            
            let headerHeight: CGFloat = Defaults.headerHeight
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(headerHeight)
            )
            
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            // Section
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = Defaults.spaceBetweenItems
            section.contentInsets = NSDirectionalEdgeInsets(
                top: Defaults.spaceBetweenHeaderAndItems,
                leading: Defaults.sectionLeftInsert,
                bottom: Defaults.spaceBetweenFooterAndItems,
                trailing: Defaults.sectionRightInsert
            )
            
            section.boundarySupplementaryItems = [header]
            return section
        }
        
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = Defaults.spaceBetweenItems
        
        layout.configuration = configuration
        return layout
    }()
    
    var presenter: HomePresenterProtocol!
    
    // override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOutlets()
        configureNavigationBar()
        presenter.configureView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogService.debugLog("\(className): viewed", prefix: .viewed)
    }
    
    // Functions
    
    private func configureOutlets() {
        collectionView.collectionViewLayout = collectionViewLayout
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = Defaults.titleText
    }
}

// MARK: - Defaults

fileprivate extension HomeViewController {
    enum Defaults {
        static let titleText: String = "Departments"
        
        static let itemsInRow: Int = 3
        static let spaceBetweenItems: CGFloat = 10.0
        
        static let sectionLeftInsert: CGFloat = 10.0
        static let sectionRightInsert: CGFloat = 10.0
        
        static let spaceBetweenHeaderAndItems: CGFloat = 4.0
        static let spaceBetweenFooterAndItems: CGFloat = 20.0
        
        static let headerHeight: CGFloat = 22.0
    }
}
