//
//  ViewController.swift
//  CustomTransition
//
//  Created by Vitalii Kizlov on 08.04.2020.
//  Copyright © 2020 Vitalii Kizlov. All rights reserved.
//

import UIKit

class ParentViewController: UIViewController {
    
    private let customModalTransition = CustomModalTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func presentTapped(_ sender: UIButton) {
        let childViewController = storyboard?.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
        childViewController.view.backgroundColor = .red
        childViewController.transitioningDelegate = customModalTransition
        childViewController.modalPresentationStyle = .custom
        present(childViewController, animated: true, completion: nil)
    }
    
}

