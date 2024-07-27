//
//  HomeRouter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeRouterProtocol

protocol HomeRouterProtocol: AnyObject {}

// MARK: - HomeRouter

final class HomeRouter: HomeRouterProtocol {
    
    // Properties
    
    weak var viewController: HomeViewController!
    
    // Functions
    
    init(viewController: HomeViewController!) {
        self.viewController = viewController
    }
}
