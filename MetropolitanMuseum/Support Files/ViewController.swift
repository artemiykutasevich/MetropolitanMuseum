//
//  ViewController.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var className: String = String(describing: ViewController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogService.debugLog("👀\t\(className): viewed")
    }
}
