//
//  CustomModalTransition.swift
//  CustomTransition
//
//  Created by Vitalii Kizlov on 08.04.2020.
//  Copyright © 2020 Vitalii Kizlov. All rights reserved.
//

import UIKit

class CustomModalTransition: NSObject, UIViewControllerTransitioningDelegate {
    
    // defines frame and position
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = PresentationController(presentedViewController: presented, presenting: presenting ?? source)
        return presentationController
    }
    
    // presenting animation
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimationManager()
    }
    
    // dismiss animation
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimationManager()
    }
    
}
