//
// 
//  HomeDetailViewController.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 4.08.24.
//
//

import UIKit

// MARK: - HomeDetailViewProtocol

protocol HomeDetailViewProtocol: AnyObject {
    var blurImageView: UIImageView! { get }
    var mainImageView: UIImageView! { get }
    
    var titleLabel: UILabel! { get }
    var titleImageView: UIImageView! { get }
    
    var bodyLabel: UILabel! { get }
    var departmentLabel: UILabel! { get }
}

// MARK: - HomeDetailViewController

final class HomeDetailViewController: UIViewController, HomeDetailViewProtocol {
    
    // @IBOutlets
    
    @IBOutlet weak var blurImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    
    // Properties
    
    var presenter: HomeDetailPresenterProtocol!
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame.size = Defaults.CloseButton.size
        button.setImage(Defaults.CloseButton.image, for: .normal)
        button.setTitle(nil, for: .normal)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self else { return }
            closeButtonAction()
        }), for: .touchUpInside)
        return button
    }()
    
    // override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter.configureView()
    }
    
    // Functions
    
    private func configureUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    }
    
    private func closeButtonAction() {
        dismiss(animated: true)
    }
}

// MARK: - Defaults

fileprivate extension HomeDetailViewController {
    enum Defaults {
        enum CloseButton {
            static let size: CGSize = CGSize(width: 44, height: 44)
            static let image: UIImage? = UIImage(systemName: "xmark")?
                .withConfiguration(UIImage.SymbolConfiguration(pointSize: 17, weight: .semibold))
                .withTintColor(.label, renderingMode: .alwaysOriginal)
        }
    }
}
