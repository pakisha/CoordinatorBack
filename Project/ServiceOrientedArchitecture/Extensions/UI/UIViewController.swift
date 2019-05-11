//
//  UIViewController.swift
//  HauteCurator
//
//  Created by Pavle Pesic on 1/29/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    // MARK: - Public methods
    
    // MARK: Loader
    
    func shouldHideLoader(isHidden: Bool) {
        if isHidden {
            MBProgressHUD.hide(for: self.view, animated: true)
        } else {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    // MARK: Alerts
    
    func showAlertWith(message: AlertMessage , style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: message.title, message: message.body, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
