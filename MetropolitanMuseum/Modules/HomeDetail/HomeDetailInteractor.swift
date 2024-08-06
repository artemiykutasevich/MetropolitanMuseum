//
// 
//  HomeDetailInteractor.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 4.08.24.
//
//

import Foundation
import Kingfisher

// MARK: - HomeDetailInteractorProtocol

protocol HomeDetailInteractorProtocol: AnyObject {
    var model: MuseumObjectModel { get }
    
    func getModelImage(completion: @escaping ResultUIImageBlock)
    func getBodyText() -> String
}

// MARK: - HomeDetailInteractor

final class HomeDetailInteractor {
    
    // Properties
    
    weak var presenter: HomeDetailPresenterProtocol!
    
    var model: MuseumObjectModel
    
    // Functions
    
    init(presenter: HomeDetailPresenterProtocol, model: MuseumObjectModel) {
        self.presenter = presenter
        self.model = model
    }
}

// MARK: - HomeDetailInteractor + HomeDetailInteractorProtocol

extension HomeDetailInteractor: HomeDetailInteractorProtocol {
    func getModelImage(completion: @escaping ResultUIImageBlock) {
        let url = URL(string: model.primaryImageSmall)
        KF.url(url)
            .onSuccess({ resultImage in
                return completion(.success(resultImage.image))
            })
            .onFailure({ resultError in
                return completion(.failure(resultError))
            })
            .set(to: UIImageView())
    }
    
    func getBodyText() -> String {
        let models = [model.culture, model.period, model.dynasty, model.reign]
        let bodyText: String = models.enumerated().reduce(into: "") {
            let text: String = if let item = $1.element {
                if item.isEmpty {
                    "no information"
                } else {
                    String(describing: item)
                }
            } else {
                "no information"
            }
            return $0 += ($1.offset == (models.count - 1) ? "\(text)" : "\(text)\n")
        }
        
        return bodyText
    }
}
