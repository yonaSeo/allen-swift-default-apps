//
//  ViewController.swift
//  LoginProject
//
//  Created by yona on 11/13/23.
//

import UIKit


// MARK: - View Controller
final class ViewController: UIViewController {
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        setAddTarget()
    }
    
    // MARK: - Present logic
    func setAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }

    @objc func loginButtonTapped() {
        print("로그인 버튼 클릭")
    }
    
    @objc func resetButtonTapped() {
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default) { action in
            print("확인")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { action in
            print("취소")
        }
        
        alert.addAction(confirm)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}
