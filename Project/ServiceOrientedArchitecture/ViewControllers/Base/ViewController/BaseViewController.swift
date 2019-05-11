//
//  BaseViewController.swift
//  ServiceOrientedArchitecture
//
//  Created by Pavle Pesic on 4/3/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CoordinatorNavigationControllerDelegate {

    // MARK: - Controller lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupNavigationController()
    }
    
    // MARK: - Private methods
    
    private func setupNavigationController() {
        if let navigationController = self.navigationController as? CoordinatorNavigationController {
            navigationController.swipeBackDelegate = self
        }
    }
    
    // MARK: - SwipeBackNavigationControllerDelegate
    
    internal func transitionBackFinished() {
        
    }
    
    internal func didSelectCustomBackAction() {
        
    }

}
