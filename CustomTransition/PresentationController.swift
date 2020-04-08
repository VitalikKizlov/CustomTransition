//
//  PresentationController.swift
//  CustomTransition
//
//  Created by Vitalii Kizlov on 08.04.2020.
//  Copyright © 2020 Vitalii Kizlov. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.3)
        view.alpha = 0
        return view
    }()
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let width = containerView!.bounds.size.width
        let height = containerView!.bounds.size.height / 2
        return CGRect(x: 0, y: height, width: width, height: height)
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
        dimmedView.frame = containerView!.frame
    }
    
    // Animation Methods
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        containerView?.addSubview(presentedView!)
        containerView!.insertSubview(dimmedView, at: 0)
        performAlongsideTransitionIfPossible {
            self.dimmedView.alpha = 1
        }
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
        if !completed {
            self.dimmedView.removeFromSuperview()
        }
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        performAlongsideTransitionIfPossible {
            self.dimmedView.alpha = 0
        }
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if completed {
            self.dimmedView.removeFromSuperview()
        }
    }
    
    // MARK: - Private
    
    private func performAlongsideTransitionIfPossible(_ completion: @escaping () -> Void) {
        guard let coordinator = self.presentedViewController.transitionCoordinator else {
            completion()
            return
        }
        coordinator.animate(alongsideTransition: { (context) in
            completion()
        }, completion: nil)
    }
    
}
