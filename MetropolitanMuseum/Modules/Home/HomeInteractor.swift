//
//  HomeInteractor.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeInteractorProtocol

protocol HomeInteractorProtocol: AnyObject {
    var models: [MuseumObjectModel] { get set }
}

// MARK: - HomeInteractor

final class HomeInteractor: HomeInteractorProtocol {
    
    // Properties
    
    weak var presenter: HomePresenterProtocol!
    
    private lazy var museumProvider: MuseumProviderProtocol = serviceLocator.getService()
    
    var models: [MuseumObjectModel] = []
    
    // Functions
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.museumProvider.getObjects { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let model):
                    let dispatchGroup = DispatchGroup()
                    
                    for index in (0...20) {
                        dispatchGroup.enter()
                        
                        let objectId = model.objectIDs[index].description
                        self.museumProvider.getObject(id: objectId) { [weak self] result in
                            guard let self else { return }
                            switch result {
                            case .success(let object):
                                models.append(object)
                                dump(object)
                            case .failure(let error):
                                dump(error)
                            }
                            dispatchGroup.leave()
                        }
                    }
                    
                    dispatchGroup.notify(queue: .main) {
                        presenter.updateCollectionView()
                    }
                case .failure(let error):
                    dump(error)
                }
            }
        }
    }
}
