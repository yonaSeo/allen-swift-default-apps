//
//  LoginViewController.swift
//  NavTabCodeUpgrade
//
//  Created by yona on 12/5/23.
//

import UIKit

class LoginViewController: UIViewController {
    private lazy var loginButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(loginButton)
        view.backgroundColor = .darkGray
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc func loginButtonTapped() {
        dismiss(animated: true)
    }
}
