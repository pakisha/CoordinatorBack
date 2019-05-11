//
//  FadeAnimator.swift
//  EncoreJets
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import Foundation

import UIKit

class FadeAnimator: NSObject {
    
    // MARK: - Vars & Lets
    
    let animationDuration: Double
    weak var storedContext: UIViewControllerContextTransitioning?
    private var isPresenting = false
    
    // MARK: - Initialization
    
    init(animationDuration: Double, isPresenting: Bool) {
        self.animationDuration = animationDuration
        self.isPresenting = isPresenting
    }
    
}

// MARK: - Extensions
// MARK: - UIViewControllerAnimatedTransitioning

extension FadeAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return animationDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        if self.isPresenting {
            if let toView = toView {
                toView.alpha = 0
                transitionContext.containerView.addSubview(toView)
            }
        } else {
            if let toView = toView {
                if let fromView = fromView {
                    fromView.alpha = 1
                    transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
                }
            }
        }
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration,
                       animations: {
                        if self.isPresenting {
                            toView?.alpha = 1
                        } else {
                            fromView?.alpha = 0
                        }
        }) { finished in
            transitionContext.completeTransition(true)
        }
    }
    
}
