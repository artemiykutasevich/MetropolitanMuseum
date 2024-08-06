//
// 
//  HomeDetailRouter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 4.08.24.
//
//

import UIKit

// MARK: - HomeDetailRouterProtocol

protocol HomeDetailRouterProtocol: AnyObject {}

// MARK: - HomeDetailRouter

final class HomeDetailRouter {
    
    // Properties
    
    weak var view: HomeDetailViewProtocol!
    
    // override
    
    init(view: HomeDetailViewProtocol) {
        self.view = view
    }
}

// MARK: - HomeDetailView + HomeDetailViewProtocol

extension HomeDetailRouter: HomeDetailRouterProtocol {
}
