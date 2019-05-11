//
//  AuthCoordinator.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, CoordinatorFinishOutput {
    
    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let factory: Factory
    
    // MARK: - Private methods
    
    private func showLoginRegisterViewController() {
        let showLoginRegisterViewController = self.factory.instantiateChooseLoginRegisterViewController()
        showLoginRegisterViewController.onRegister = { [unowned self] in
            self.showRegisterViewController()
        }
        showLoginRegisterViewController.onLogin = { [unowned self] in
            self.showLoginViewController()
        }
        showLoginRegisterViewController.onTermsAndConditions = { [weak self] in
            self?.presentTermsAndConditionsViewController()
        }
        self.router.setRootModule(showLoginRegisterViewController, hideBar: false, animated: false)
    }
    
    private func showLoginViewController() {
        let loginViewController = self.factory.instantiateLoginViewController()
        loginViewController.onBack = { [unowned self] in
            self.router.popModule(transition: FadeAnimator(animationDuration: 0.2, isPresenting: false))
        }
        loginViewController.onLogin = {
            self.presentWalktroughViewController()
        }
        self.router.push(loginViewController, transition: FadeAnimator(animationDuration: 0.2, isPresenting: true))
    }
    
    private func showRegisterViewController() {
        let registerViewController = self.factory.instantiateRegisterViewController()
        registerViewController.onBack = { [unowned self] in
            self.router.popModule()
        }
        registerViewController.onRegister = {
            self.presentWalktroughViewController()
        }
        self.router.push(registerViewController)
    }
    
    private func presentTermsAndConditionsViewController() {
        let termsAndConditionsViewController = self.factory.instantiateTermsAndConditionsViewController()
        termsAndConditionsViewController.onClose = { [weak self] in
            self?.router.dismissModule()
        }
        self.router.present(termsAndConditionsViewController)
    }
    
    private func presentWalktroughViewController() {
        let coordinator = self.factory.instantiateWalktroughCoordinator(router: self.router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
        }
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showLoginRegisterViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory) {
        self.router = router
        self.factory = factory
    }
    
}
