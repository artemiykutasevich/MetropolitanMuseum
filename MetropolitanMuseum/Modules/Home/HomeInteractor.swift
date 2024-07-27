//
//  HomeInteractor.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeInteractorProtocol

protocol HomeInteractorProtocol: AnyObject {}

// MARK: - HomeInteractor

final class HomeInteractor: HomeInteractorProtocol {
    
    // Properties
    
    weak var presenter: HomePresenterProtocol!
    
    // Functions
    
    required init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}
