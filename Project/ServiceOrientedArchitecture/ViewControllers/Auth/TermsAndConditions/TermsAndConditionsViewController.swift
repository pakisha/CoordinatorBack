//
//  TermsAndConditionsViewController.swift
//  ServiceOrientedArchitecture
//
//  Created by Pavle Pesic on 4/4/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

protocol TermsAndConditionsViewControllerProtocol: class {
    var onClose: (() -> Void)? { get set }
}

class TermsAndConditionsViewController: UIViewController, TermsAndConditionsViewControllerProtocol {
    
    // MARK: - TermsAndConditionsViewControllerProtocol
    
    var onClose: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    var viewModel: TermsAndConditionsViewModelProtocol?
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction private func actionClose() {
        self.onClose?()
    }
    
}
