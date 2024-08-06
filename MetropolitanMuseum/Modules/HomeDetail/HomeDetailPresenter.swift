//
// 
//  HomeDetailPresenter.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 4.08.24.
//
//

import Foundation

// MARK: - HomeDetailPresenterProtocol

protocol HomeDetailPresenterProtocol: AnyObject {
    var router: HomeDetailRouterProtocol! { get set }
    
    func configureView()
}

// MARK: - HomeDetailPresenter

final class HomeDetailPresenter {
    
    // Properties
    
    weak var view: HomeDetailViewProtocol!
    var interactor: HomeDetailInteractorProtocol!
    var router: HomeDetailRouterProtocol!
    
    // Functions
    
    init(view: HomeDetailViewProtocol) {
        self.view = view
    }
}

// MARK: - HomeDetailInteractor + HomeDetailInteractorProtocol

extension HomeDetailPresenter: HomeDetailPresenterProtocol {
    func configureView() {
        view.titleLabel.text = interactor.model.title
        view.titleImageView.image = interactor.model.isHighlight ? Constants.UI.highlightedItemImage : Constants.UI.unhighlightedItemImage
        
        view.bodyLabel.text = interactor.getBodyText()
        view.departmentLabel.text = interactor.model.department
        
        interactor.getModelImage { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let resultImage):
                view.blurImageView.image = resultImage
                view.mainImageView.image = resultImage
            case .failure(_):
                view.mainImageView.image = Constants.UI.errorImage
            }
        }
    }
}
