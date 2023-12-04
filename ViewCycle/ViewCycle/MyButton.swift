//
//  MyButton.swift
//  ViewCycle
//
//  Created by yona on 12/2/23.
//

import UIKit

class MyButton: UIButton {
    var onOffFlag: Bool = false
    
    private lazy var insideButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        return button
    }()
    
    func onOffToggle() {
        self.onOffFlag.toggle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(insideButton)
        insideButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        insideButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        insideButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5).isActive = true
        insideButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        insideButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        insideButton.frame.size = CGSize(width: self.frame.size.width / 2, height: self.frame.size.width / 2)
//        insideButton.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        insideButton.layer.cornerRadius = insideButton.frame.width / 2
        insideButton.layer.masksToBounds = true
//        self.layer.cornerRadius = self.frame.width / 2
//        self.layer.masksToBounds = true
        print(#function + " loaded")
    }
}
