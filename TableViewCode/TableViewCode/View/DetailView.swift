//
//  DetailView.swift
//  TableViewCode
//
//  Created by yona on 12/6/23.
//

import UIKit

class DetailView: UIView {
    public let movieImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    public let movieNameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    public let movieDescriptionLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupStackView()
        setupStackViewLayout()
        setupMovieImageViewLayout()
        setupMovieNameLabelLayout()
        setupMovieDescriptionLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(movieImageView)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(movieDescriptionLabel)
    }
    
    func setupStackViewLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupMovieImageViewLayout() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.heightAnchor.constraint(equalToConstant: 240),
            movieImageView.widthAnchor.constraint(equalToConstant: 240),
        ])
    }
    
    func setupMovieNameLabelLayout() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        movieNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupMovieDescriptionLayout() {
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
