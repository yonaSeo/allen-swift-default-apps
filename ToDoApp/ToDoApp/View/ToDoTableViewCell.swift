//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit

final class ToDoTableViewCell: UITableViewCell {
    var delegate: ToDoTableViewDelegate?
    
    var toDoData: ToDoData? {
        didSet { setupData() }
    }
    
    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let toDoTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("UPDATE", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 10)
        button.setImage(UIImage(systemName: "pencil.tip"), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return button
    }()
    
//    // var updateButtonTappedClosure: (ToDoTableViewCell) -> Void = { sender in }
//    var updateButtonTappedClosure: (() -> Void)?
    
    @objc func updateButtonTapped(_ sender: UIButton) {
//        // updateButtonTappedClosure(self)
//        updateButtonTappedClosure?()
        delegate?.updateButtonTapped(cell: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        self.contentView.addSubview(backView)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(toDoTextLabel)
        stackView.addArrangedSubview(bottomView)
        bottomView.addSubview(dateLabel)
        bottomView.addSubview(updateButton)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 24),
            backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24),
            
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -8),
            
            toDoTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 48),
            
            bottomView.heightAnchor.constraint(equalToConstant: 32),
            
            dateLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            
            updateButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            updateButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 76),
            updateButton.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    func setupData() {
        let color = Color(rawValue: self.toDoData!.color)
        backView.backgroundColor = color?.lightColor
        updateButton.backgroundColor = color?.darkColor
        
        toDoTextLabel.text = self.toDoData?.memoText
        dateLabel.text = self.toDoData?.dateString
    }
    
}
