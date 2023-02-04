//
//  ViewController.swift
//  UIKitCaseStudies
//
//  Created by Harry Lee on 04.02.23.
//

import UIKit
import UICelebrator

class ViewController: UIViewController {

    private let celebrator = UICelebrator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        celebrator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(celebrator)
        
        NSLayoutConstraint.activate([
            celebrator.topAnchor.constraint(equalTo: view.topAnchor),
            celebrator.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            celebrator.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            celebrator.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

