//
//  HomeRouter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeRouterProtocol

protocol HomeRouterProtocol: AnyObject {
    func handleError(_ error: InternetError)
}

// MARK: - HomeRouter

final class HomeRouter: BaseClass {
    
    // Properties
    
    weak var viewController: HomeViewController!
    
    private lazy var alertRouter: AlertRouterProtocol = serviceLocator.getService()
    
    // Functions
    
    init(viewController: HomeViewController!) {
        self.viewController = viewController
    }
}

// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {
    func handleError(_ error: InternetError) {
        switch error {
        case .noInternetConnection:
            alertRouter.showInternetErrorAlert(from: viewController)
        default:
            alertRouter.showErrorAlert(from: viewController)
        }
    }
}
