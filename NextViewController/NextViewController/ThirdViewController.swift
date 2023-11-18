//
//  ThirdViewController.swift
//  NextViewController
//
//  Created by yona on 11/19/23.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    public var someText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someText
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
