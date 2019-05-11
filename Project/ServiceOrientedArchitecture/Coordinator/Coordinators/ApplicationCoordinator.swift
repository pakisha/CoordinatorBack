//
//  ApplicationCoordinator.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    
    private let factory: Factory
    private let router: RouterProtocol
    private var launchInstructor: LaunchInstructor
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            switch launchInstructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runAuthFlow() {
        let coordinator = self.factory.instantiateAuthCoordinator(router: self.router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: false)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }

    private func runOnboardingFlow() {
        let coordinator = self.factory.instantiateWalktroughCoordinator(router: self.router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.launchInstructor = LaunchInstructor.configure(isAutorized: true, tutorialWasShown: true)
            self.start()
        }
        self.addDependency(coordinator)
        coordinator.start()
    }

    private func runMainFlow() {
        
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, factory: Factory, launchInstructor: LaunchInstructor) {
        self.router = router
        self.factory = factory
        self.launchInstructor = launchInstructor
    }
    
}
