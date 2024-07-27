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

final class HomePresenter: HomePresenterProtocol {
    
    // Properties
    
    weak var view: HomeViewProtocol!
    var interactor: HomeInteractorProtocol!
    var router: HomeRouterProtocol!
    
    // Functions
    
    required init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func configureView() {}
}
