//
//  MainRouter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import UIKit

// MARK: - MainRouterProtocol

protocol MainRouterProtocol {
    func showHomeScreen()
}

// MARK: - MainRouter

final class MainRouter {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: MainRouterProtocol

extension MainRouter: MainRouterProtocol {
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        window.rootViewController = mainViewController
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
    }
}
