//
//  ViewController.swift
//  NavTabCodeUpgrade
//
//  Created by yona on 12/5/23.
//

import UIKit

class FirstViewController: UIViewController {
    private var isLogin = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        self.title = "Main"
        
        setupNavigationController()
        
        if !isLogin {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true)
        }
    }

    func setupNavigationController() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkGray
        //appearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

