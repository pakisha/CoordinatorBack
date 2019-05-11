//
//  WalktroughViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/22/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol WalktroughViewControllerProtocol: class {
    var onFinishWalktrough: ((_ shouldPopViewController: Bool) -> Void)? { get set }
}

class WalktroughViewController: BaseViewController, WalktroughViewControllerProtocol {
    
    // MARK: - WalktroughViewControllerProtocol
    
    var onFinishWalktrough: ((Bool) -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: WalktroughViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionFinishWalktrough() {
        self.onFinishWalktrough?(true)
    }
    
    // MARK: - Overrides
    
    override func transitionBackFinished() {
        self.onFinishWalktrough?(false)
    }
    
    override func didSelectCustomBackAction() {
        self.onFinishWalktrough?(true)
    }
    
}
