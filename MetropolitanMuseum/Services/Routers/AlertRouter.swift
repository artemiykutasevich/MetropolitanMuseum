//
//  AlertRouter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 30.07.24.
//

import UIKit

// MARK: - AlertRouterProtocol

protocol AlertRouterProtocol {
    func showErrorAlert(from viewController: UIViewController)
    func showInternetErrorAlert(from viewController: UIViewController)
}

// MARK: - AlertRouter

final class AlertRouter {
    func presentAlert(titleText: String, messageText: String, from viewController: UIViewController) {
        let alertViewController = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertViewController.addAction(action)
        viewController.present(alertViewController, animated: true)
    }
}

// MARK: - AlertRouter + AlertRouterProtocol

extension AlertRouter: AlertRouterProtocol {
    func showErrorAlert(from viewController: UIViewController) {
        presentAlert(titleText: "⚠️ Warning ⚠️", messageText: "Something went wrong", from: viewController)
    }
    
    func showInternetErrorAlert(from viewController: UIViewController) {
        presentAlert(titleText: "🛜 No Internet 🛜", messageText: "Check your internet connection and try again", from: viewController)
    }
}
