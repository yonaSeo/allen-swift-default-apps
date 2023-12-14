//
//  MovieTableViewCell.swift
//  TableViewCode
//
//  Created by yona on 12/6/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    public var movieImageView = {
        let image = UIImageView()
        return image
    }()
    
    public var movieNameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    public var movieDescriptionLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var stackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupStackViewLayout()
        setupMovieImageViewLayout()
        setupMovieNameLabelLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.contentView.addSubview(movieImageView)
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(movieDescriptionLabel)
    }
    
//    override func updateConstraints() {
//        setupStackViewLayout()
//        setupMovieImageViewLayout()
//        setupMovieNameLabelLayout()
//        super.updateConstraints()
//    }
    
    
    func setupStackViewLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor),
        ])
    }
    
    func setupMovieImageViewLayout() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.heightAnchor.constraint(equalToConstant: 100),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            movieImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    func setupMovieNameLabelLayout() {
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
