//
//  MemberTableViewCell.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit

final class MemberTableViewCell: UITableViewCell {
    var member: Member? {
        didSet {
            guard var member else { return }
            memberImageView.image = member.memberImage
            memberNameLabel.text = member.name
            memberAddressLabel.text = member.address
        }
    }
    
    let memberImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        // 아래는 적용 안 됨 -> init에서 스택뷰 셋업할 때 아직 frame 설정 안 됐기 때문
        // iv.layer.masksToBounds = true
        // iv.layer.cornerRadius = memberImageView.frame.width / 2
        return iv
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal error")
    }
    
//    override func updateConstraints() {
//        setupConstraints()
//        super.updateConstraints()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupStackView() {
        self.addSubview(memberImageView)
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(memberNameLabel)
        stackView.addArrangedSubview(memberAddressLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            memberImageView.heightAnchor.constraint(equalToConstant: 60),
            memberImageView.widthAnchor.constraint(equalToConstant: 60),
            memberImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            memberImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: memberImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: memberImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: memberImageView.bottomAnchor),
            
            memberNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
    
    func setupLayout() {
        memberImageView.layer.masksToBounds = true
        memberImageView.layer.cornerRadius = memberImageView.frame.width / 2
    }
}
