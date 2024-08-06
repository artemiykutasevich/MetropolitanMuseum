//
//  HomeConfigurator.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeConfiguratorProtocol

protocol HomeConfiguratorProtocol: AnyObject {
    static func instantiate() -> HomeViewController
}

// MARK: - HomeConfigurator

final class HomeConfigurator: HomeConfiguratorProtocol {
    static func instantiate() -> HomeViewController {
        let viewController: HomeViewController = HomeViewController.loadFromNib()
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
