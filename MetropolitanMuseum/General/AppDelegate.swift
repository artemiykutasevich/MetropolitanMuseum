//
//  AppDelegate.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import UIKit

let serviceLocator = ServiceLocator()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Setup
        setupServices()
        
        // Change screen
        let mainRouter: MainRouterProtocol = serviceLocator.getService()
        mainRouter.showHomeScreen()
        
        return true
    }
}

fileprivate extension AppDelegate {
    func setupServices() {
        guard let window else { return }
        serviceLocator.addService { MainRouter(window: window) as MainRouterProtocol }
    }
}
