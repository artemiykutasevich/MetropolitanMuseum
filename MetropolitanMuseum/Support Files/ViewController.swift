//
//  ViewController.swift
//  MetropolitanMuseum
//
//  Created by Artem Kutasevich on 23.07.24.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    
    // override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LogService.debugLog("👀\t\(className): viewed")
    }
}
