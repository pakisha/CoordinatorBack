//
//  ViewControllerFactory.swift
//  EncoreJets
//
//  Created by Pavle Pesic on 5/24/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

protocol AuthViewControllerFactory {
    func instantiateChooseLoginRegisterViewController() -> ChooseLoginRegisterViewController
    func instantiateLoginViewController() -> LoginViewController
    func instantiateRegisterViewController() -> RegisterViewController
    func instantiateTermsAndConditionsViewController() -> TermsAndConditionsViewController
}

protocol WalktroughViewControllerFactory {
    func instantiateWalktroughViewController() -> WalktroughViewController
}


