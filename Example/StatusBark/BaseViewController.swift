//
//  BaseViewController.swift
//  StatusBark_Example
//
//  Created by Fyodor Volchyok on 4/20/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addDismissButtonIfNedded()
    }
    
    func addDismissButtonIfNedded() {
        guard isBeingPresented else { return }
        let dismissButton = UIButton(type: .system)
        view.addSubview(dismissButton)
        dismissButton.addTarget(self, action: #selector(dismissIfPossible), for: .touchUpInside)
        dismissButton.setTitle("dismiss", for: .normal)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func dismissIfPossible() {
        guard let presentingViewController = self.presentingViewController else { return }
        presentingViewController.dismiss(animated: true
            , completion: nil)
    }
    
}
