//
//  HomeInteractor.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 25.07.24.
//

import Foundation

// MARK: - HomeInteractorProtocol

protocol HomeInteractorProtocol: AnyObject {
    var objects: [MuseumItem] { get set }
    
    func loadData(completion: @escaping EmptyBlock)
}

// MARK: - HomeInteractor

final class HomeInteractor: BaseClass {
    // Properties
    
    weak var presenter: HomePresenterProtocol!
    
    private lazy var museumProvider: MuseumProviderProtocol = serviceLocator.getService()
    
    var objects: [MuseumItem] = []
    
    // Functions
    
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: HomeInteractorProtocol

extension HomeInteractor: HomeInteractorProtocol {
    func loadData(completion: @escaping EmptyBlock) {
        loadDepartments { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let model):
                let departmentsDispatchGroup = DispatchGroup()
                
                model.departments.forEach({ department in
                    departmentsDispatchGroup.enter()
                    
                    DispatchQueue.global().async {
                        self.loadDepartment(departmentId: department.departmentId) { [weak self] result in
                            guard let self else { return }
                            
                            switch result {
                            case .success(let model):
                                let objectsDispatchGroup = DispatchGroup()
                                
                                var museumObjectModel: [MuseumObjectModel] = []
                                
                                model.objectIDs.forEach({ objectId in
                                    objectsDispatchGroup.enter()
                                    self.loadObject(objectId: objectId) { result in
                                        switch result {
                                        case .success(let model):
                                            museumObjectModel.append(model)
                                        case .failure(_):
                                            break
                                        }
                                        
                                        objectsDispatchGroup.leave()
                                    }
                                })
                                
                                objectsDispatchGroup.notify(queue: .global()) {
                                    self.objects.append(MuseumItem(
                                        department: MuseumItem.Department(
                                            id: department.departmentId,
                                            name: department.displayName
                                        ),
                                        objects: museumObjectModel)
                                    )
                                    
                                    departmentsDispatchGroup.leave()
                                }
                            case .failure(_):
                                departmentsDispatchGroup.leave()
                            }
                        }
                    }
                })
                
                departmentsDispatchGroup.notify(queue: .global()) {
                    DispatchQueue.main.async {
                        completion()
                    }
                }
            case .failure(let error):
                handleError(error)
            }
        }
    }
}

extension HomeInteractor {
    func loadDepartments(completion: @escaping MuseumDepartmentsResultBlock) {
        museumProvider.getDepartments { [weak self] result in
            defer { completion(result) }
            
            guard let self else { return }
            switch result {
            case .success(_):
                LogService.debugLog("\(className): get departments success", prefix: .success)
            case .failure(let error):
                LogService.debugLog("\(className): get departments failure with error: \(String(describing: error.errorDescription))", prefix: .failure)
            }
        }
    }
    
    func loadDepartment(departmentId: Int, completion: @escaping MuseumObjectsModelResultBlock) {
        museumProvider.getObjects(departmentId) { [weak self] result in
            defer { completion(result) }
            
            guard let self else { return }
            switch result {
            case .success(_):
                LogService.debugLog("\(className): get department id \(departmentId)", prefix: .success)
            case .failure(let error):
                LogService.debugLog("\(className): get department id \(departmentId) with error: \(String(describing: error.errorDescription))", prefix: .failure)
            }
        }
    }
    
    func loadObject(objectId: Int, completion: @escaping MuseumObjectModelResultBlock) {
        museumProvider.getObject(id: objectId.description) { [weak self] result in
            defer { completion(result) }
            
            guard let self else { return }
            switch result {
            case .success(_):
                LogService.debugLog("\(className): get object id \(objectId)", prefix: .success)
            case .failure(let error):
                LogService.debugLog("\(className): get object id \(objectId) with error: \(String(describing: error.errorDescription))", prefix: .failure)
            }
        }
    }
    
    func handleError(_ error: InternetError) {
        presenter.router.handleError(error)
    }
}
