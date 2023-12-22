//
//  EditView.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit

final class EditView: UIView {
    private let colorButtonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var redButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle("긴급", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var yellowButton: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle("중요", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var greenButton: UIButton = {
        let button = UIButton()
        button.tag = 3
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle("보통", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var blueButton: UIButton = {
        let button = UIButton()
        button.tag = 4
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitle("여유", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let textBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    public let textView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    public let saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        self.addSubview(colorButtonStackView)
        colorButtonStackView.addArrangedSubview(redButton)
        colorButtonStackView.addArrangedSubview(yellowButton)
        colorButtonStackView.addArrangedSubview(greenButton)
        colorButtonStackView.addArrangedSubview(blueButton)
        
        self.addSubview(textBackView)
        textBackView.addSubview(textView)
        
        self.addSubview(saveButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            colorButtonStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorButtonStackView.bottomAnchor.constraint(equalTo: textBackView.topAnchor, constant: -40),
            colorButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            colorButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            colorButtonStackView.heightAnchor.constraint(equalToConstant: 40),
            
            textBackView.topAnchor.constraint(equalTo: colorButtonStackView.bottomAnchor, constant: 40),
            textBackView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -40),
            textBackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            textBackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            textBackView.heightAnchor.constraint(equalToConstant: 200),
            
            textView.topAnchor.constraint(equalTo: textBackView.topAnchor, constant: 16),
            textView.bottomAnchor.constraint(equalTo: textBackView.bottomAnchor, constant: -16),
            textView.leadingAnchor.constraint(equalTo: textBackView.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: textBackView.trailingAnchor, constant: -16),
            
            saveButton.topAnchor.constraint(equalTo: textBackView.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            saveButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
