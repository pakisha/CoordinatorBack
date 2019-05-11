//
//  RegisterViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/21/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol RegisterViewControllerProtocol: class {
    var onBack: (() -> Void)? { get set }
    var onRegister: (() -> Void)? { get set }
}

class RegisterViewController: BaseViewController, RegisterViewControllerProtocol {
    
    // MARK: - RegisterViewControllerProtocol
    
    var onBack: (() -> Void)?
    var onRegister: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: RegisterViewModelProtocol?
    
    // MARK: - Overrides
    
    override func didSelectCustomBackAction() {
        self.onBack?()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionRegister() {
        self.onRegister?()
    }
    
}
