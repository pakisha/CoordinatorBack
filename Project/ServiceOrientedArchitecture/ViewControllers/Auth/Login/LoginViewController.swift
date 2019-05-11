//
//  LoginViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/19/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol LoginViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onLogin: (() -> Void)? { get set }
}

class LoginViewController: BaseViewController, LoginViewControllerProtocol {
    
    // MARK: - LoginViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onLogin: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: LoginViewModelProtocol!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Overrides
    
    override func didSelectCustomBackAction() {
        self.onBack?()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionLogin() {
        self.onLogin?()
    }
    
}
