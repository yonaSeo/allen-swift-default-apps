//
//  ViewController.swift
//  NavTabCode
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
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        
        vc1.title = "Main"
        vc2.title = "Search"
        vc3.title = "Favorite"
        vc4.title = "Profile"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .darkGray
        
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "magnifyingglass")
        items[2].image = UIImage(systemName: "star.fill")
        items[3].image = UIImage(systemName: "person.fill")
        
        present(tabBarVC, animated: true)
    }

}

