//
//  ServiceLocator.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import Foundation

// MARK: - ServiceLocatorProtocol

protocol ServiceLocatorProtocol {
    func getService<T>() -> T
    func getService<T>(_: T.Type) -> T?
}

// MARK: - ServiceLocator

final class ServiceLocator: ServiceLocatorProtocol {
    enum RegistryRecord {
        case instance(Any)
        case recipe(() -> Any)
    }
    
    fileprivate lazy var registry: [String: RegistryRecord] = [:]
    
    fileprivate lazy var className: String = String(describing: self)
    
    func addService<T>(_ recipe: @escaping () -> T) {
        let key = getTypeName(T.self)
        registry[key] = .recipe(recipe)
        LogService.debugLog("✅\t\(className): did register \(T.self)")
    }
    
    func addService<T>(_ instance: T) {
        let key = getTypeName(T.self)
        registry[key] = .instance(instance)
    }
    
    func getService<T>(_: T.Type) -> T? {
        let instanceToFind: T?
        if let registryRec = registry[getTypeName(T.self)] {
            switch registryRec {
            case .instance(let _instance):
                instanceToFind = _instance as? T
            case .recipe(let recipe):
                instanceToFind = recipe() as? T
                if let instance = instanceToFind {
                    addService(instance)
                }
            }
        } else {
            instanceToFind = nil
            assert(false, "❌\t\(className): service: \(T.self) not register")
        }
        
        return instanceToFind
    }
    
    func getService<T>() -> T {
        getService(T.self)!
    }
    
    private func getTypeName(_ some: Any) -> String {
        (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
