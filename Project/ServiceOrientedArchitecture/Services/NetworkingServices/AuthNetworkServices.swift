//
//  AuthNetworkServices.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/20/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import Foundation

class AuthNetworkServices {
    
    // MARK: - Vars & Lets
    
    private let apiManager: APIManager
    
    func getUser(handler: @escaping (Swift.Result<ChooseLoginRegister.User, AlertMessage>) -> Void) {
        self.apiManager.call(type: RequestItemsType.getUser) { (res: Result<ChooseLoginRegister.User, AlertMessage>) in
            switch res {
            case .success(let user):
                handler(.success(user))
                break
            case .failure(let message):
                handler(.failure(message))
                break
            }
        }
        
    }
    
    // MARK: - Initialization
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
}
