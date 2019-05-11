//
//  ChooseLoginRegisterModels.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/18/19.
//  Copyright (c) 2019 Pavle Pesic. All rights reserved.
//

import UIKit

enum ChooseLoginRegister {
    
    struct User: Codable {
        let fullName: String
        let email: String
        let isPrimeUser: Bool
        let paymentMethods: [String]
    }
    
}
