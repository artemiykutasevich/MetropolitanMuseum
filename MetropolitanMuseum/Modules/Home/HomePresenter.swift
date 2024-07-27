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
    
    func getEntitiesCount() -> Int
    func updateCollectionView()
}

// MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    // Properties
    
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    // Functions
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func getEntitiesCount() -> Int {
        return interactor.models.count
    }
    
    func updateCollectionView() {
        view.collectionView.reloadData()
    }
}
