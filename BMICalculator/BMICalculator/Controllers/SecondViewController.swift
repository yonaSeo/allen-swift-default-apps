//
//  SecondViewController.swift
//  BMICalculator
//
//  Created by yona on 11/20/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    public var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        guard let bmi else { return }
        bmiLabel.text = String(bmi.value ?? 0)
        bmiLabel.backgroundColor = bmi.backgroundColor
        adviceLabel.text = bmi.labelText
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
