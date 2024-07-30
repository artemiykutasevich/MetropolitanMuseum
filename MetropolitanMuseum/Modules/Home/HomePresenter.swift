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
    
    func getSectionsCount() -> Int
    func getSectionName(for section: Int) -> String
    func getItemsCountFor(for section: Int) -> Int
}

// MARK: - HomePresenter

final class HomePresenter: BaseClass {
    // Properties
    
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    // Functions
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
}

// MARK: - HomePresenterProtocol

extension HomePresenter: HomePresenterProtocol {
    func configureView() {
        interactor.loadData(completion: { [weak self] in
            guard let self else { return }
            DispatchQueue.main.async {
                self.view.collectionView.reloadData()
            }
        })
    }
    
    func getSectionsCount() -> Int {
        return interactor.objects.count
    }
    
    func getSectionName(for section: Int) -> String {
        return interactor.objects[section].department.name
    }
    
    func getItemsCountFor(for section: Int) -> Int {
        return interactor.objects[section].objects.count
    }
}
