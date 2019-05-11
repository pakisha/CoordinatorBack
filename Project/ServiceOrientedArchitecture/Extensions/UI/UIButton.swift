//
//  UIButton.swift
//  ServiceOrientedArchitecture
//
//  Created by Pavle Pesic on 4/4/19.
//  Copyright © 2019 Pavle Pesic. All rights reserved.
//

import UIKit

extension UIButton {
    
    // MARK: - Public methods
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
}
