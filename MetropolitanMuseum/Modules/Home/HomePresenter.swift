//
//  HomePresenter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import UIKit

// MARK: - HomePresenterProtocol

protocol HomePresenterProtocol: AnyObject {
    var router: HomeRouterProtocol! { set get }
    
    func configureView()
}

// MARK: - HomePresenter

final class HomePresenter: NSObject, BaseClass {
    
    // Properties
    
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    // Functions
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    func configureView() {
        view.collectionView.dataSource = self
        view.collectionView.delegate = self
        
        view.collectionView.registerHeader(HomeHeaderReusableView.self)
        view.collectionView.register(HomeCollectionViewCell.self)
        
        interactor.loadData(completion: { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.view.collectionView.reloadData()
            }
        })
    }
    
    func getSectionName(for section: Int) -> String {
        let object = interactor.objects[section]
        return "\(object.department.name) (\(object.objects.count))"
    }
}

// MARK: - UICollectionViewDataSource

extension HomePresenter: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return interactor.objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interactor.objects[section].objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let object = interactor.objects[indexPath.section]
            let sectionName: String = "\(object.department.name) (\(object.objects.count))"
            
            let header: HomeHeaderReusableView = collectionView.dequeueHeader(forIndexPath: indexPath)
            header.configure(titleText: sectionName)
            return header
        case UICollectionView.elementKindSectionFooter:
            return UICollectionReusableView()
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomePresenter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? HomeCollectionViewCell else { return }
        let model: MuseumObjectModel = interactor.objects[indexPath.section].objects[indexPath.row]
        cell.configure(with: model)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? HomeCollectionViewCell else { return }
        cell.configureEmpty()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model: MuseumObjectModel = interactor.objects[indexPath.section].objects[indexPath.row]
        router.handleSelect(model)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        UIView.animate(withDuration: Constants.UI.animationDuration) {
            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        UIView.animate(withDuration: Constants.UI.animationDuration) {
            cell.transform = .identity
        }
    }
}
