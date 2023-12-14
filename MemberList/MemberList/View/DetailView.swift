//
//  DetailView.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit

final class DetailView: UIView {
    var member: Member? {
        didSet {
            guard var member else {
                updateButton.setTitle("SAVE", for: .normal)
                memberIDTextField.text = "\(Member.mememberCount)"
                return
            }
            
            memberImageView.image = member.memberImage
            memberIDTextField.text = "\(member.memberID)"
            memberNameTextField.text = member.name
            memberAgeTextField.text = member.age != nil ? "\(member.age!)" : ""
            memberPhoneNumberTextField.text = member.phoneNumber
            memberAddressTextField.text = member.address
        }
    }
    private var stackViewTopAnchorConstraints: NSLayoutConstraint!
    private let labelWidth: CGFloat = 70

    let memberImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 74
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.addSubview(memberImageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let memberIDLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "멤버 ID"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberIDTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.frame.size.height = 24
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.clearsOnBeginEditing = false
        tf.spellCheckingType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberIDStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberIDLabel, memberIDTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let memberNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "이     름"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberNameTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.frame.size.height = 24
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.clearsOnBeginEditing = false
        tf.spellCheckingType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberNameStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberNameLabel, memberNameTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let memberAgeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "나     이"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberAgeTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.frame.size.height = 24
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.clearsOnBeginEditing = false
        tf.spellCheckingType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberAgeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberAgeLabel, memberAgeTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    
    let memberPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "전화번호"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberPhoneNumberTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.frame.size.height = 24
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.clearsOnBeginEditing = false
        tf.spellCheckingType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberPhoneNumberStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberPhoneNumberLabel, memberPhoneNumberTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let memberAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "주     소"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let memberAddressTextField: UITextField = {
        let tf = UITextField()
        tf.font = .systemFont(ofSize: 16)
        tf.frame.size.height = 24
        tf.textColor = .black
        tf.borderStyle = .roundedRect
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.clearsOnBeginEditing = false
        tf.spellCheckingType = .no
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var memberAddressStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [memberAddressLabel, memberAddressTextField])
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .fill
        sv.distribution = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("UPDATE", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageContainerView, memberIDStackView, memberNameStackView, memberAgeStackView, memberPhoneNumberStackView, memberAddressStackView, updateButton])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupStackView()
        setupNotification()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        self.addSubview(stackView)
    }
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpStackView), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownStackView), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func moveUpStackView() {
        self.stackViewTopAnchorConstraints.constant = -20
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownStackView() {
        self.stackViewTopAnchorConstraints.constant = 12
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    override func updateConstraints() {
        setupConstraints()
        super.updateConstraints()
    }
    
    func setupConstraints() {
        stackViewTopAnchorConstraints = stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12)
        
        NSLayoutConstraint.activate([
            stackViewTopAnchorConstraints,
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            // stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            imageContainerView.heightAnchor.constraint(equalToConstant: 180),
            
            memberImageView.heightAnchor.constraint(equalToConstant: 148),
            memberImageView.widthAnchor.constraint(equalToConstant: 148),
            memberImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            memberImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            
            memberIDLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberNameLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberAgeLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberPhoneNumberLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            memberAddressLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            
            updateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    // 왜 안 되는지.. 모르겠음
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        memberImageView.layer.masksToBounds = true
//        memberImageView.layer.cornerRadius = memberImageView.frame.width / 2
//    }
}
