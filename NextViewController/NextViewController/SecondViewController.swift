//
//  SecondViewController.swift
//  NextViewController
//
//  Created by yona on 11/19/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    public var someText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someText
    }

    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
