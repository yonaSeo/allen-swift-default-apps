//
//  ViewController.swift
//  ViewCycle
//
//  Created by yona on 12/2/23.
//

import UIKit

class ViewController: UIViewController {
    var buttonHeightConstraint: NSLayoutConstraint!
    var buttonWidthConstraint: NSLayoutConstraint!
    
    private lazy var button: MyButton = {
        var button = MyButton()
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = button.frame.width / 2
//        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleAnimationEffect), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        button.layer.cornerRadius = button.frame.width / 2
        button.layer.masksToBounds = true
    }
    
    func setupConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        buttonHeightConstraint = button.heightAnchor.constraint(equalToConstant: 200)
        buttonWidthConstraint = button.widthAnchor.constraint(equalToConstant: 200)
        
        buttonHeightConstraint.isActive = true
        buttonWidthConstraint.isActive = true
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


    @objc func handleAnimationEffect() {
        print(#function + " loaded")
        if !button.onOffFlag {
            buttonHeightConstraint.constant = 300
            buttonWidthConstraint.constant = 300
        } else {
            buttonHeightConstraint.constant = 200
            buttonWidthConstraint.constant = 200
        }
        
        UIView.animate(withDuration: 2) {
            self.view.layoutIfNeeded()
        }
        
        button.onOffToggle()
    }
}

