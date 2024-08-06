//
// 
//  HomeDetailConfigurator.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 4.08.24.
//
//

import Foundation

// MARK: - HomeDetailConfiguratorProtocol

protocol HomeDetailConfiguratorProtocol: AnyObject {
    static func instantiate(with model: MuseumObjectModel) -> HomeDetailViewController
}

// MARK: - HomeDetailConfigurator

final class HomeDetailConfigurator: HomeDetailConfiguratorProtocol {
    static func instantiate(with model: MuseumObjectModel) -> HomeDetailViewController {
        let viewController: HomeDetailViewController = HomeDetailViewController.loadFromNib()
        let presenter = HomeDetailPresenter(view: viewController)
        let interactor = HomeDetailInteractor(presenter: presenter, model: model)
        let router = HomeDetailRouter(view: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
