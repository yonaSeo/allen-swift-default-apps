//
//  ViewController.swift
//  BMICalculator
//
//  Created by yona on 11/20/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    
    private var bmiManager = BMICalculatorManager()
    private lazy var alertManager = AlertManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        setUI()
    }
    
    func setUI() {
        heightTextField.attributedPlaceholder =
            NSAttributedString(string: "cm 단위로 입력하세요", attributes: [.foregroundColor: #colorLiteral(red: 0.3629357815, green: 0.3629357815, blue: 0.3629357815, alpha: 1), .font: UIFont.systemFont(ofSize: 15)])
        weightTextField.attributedPlaceholder =
            NSAttributedString(string: "kg 단위로 입력하세요", attributes: [.foregroundColor: #colorLiteral(red: 0.3629357815, green: 0.3629357815, blue: 0.3629357815, alpha: 1), .font: UIFont.systemFont(ofSize: 15)])
        
        heightTextField.keyboardType = .emailAddress
        weightTextField.keyboardType = .emailAddress
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    
    @IBAction func bmiCalculateButtonTapped(_ sender: UIButton) {
        guard let heightStr = heightTextField.text, heightStr != "" else { alertManager.setAlert(self, flag: .heightMissing); return }
        guard let weightStr = weightTextField.text, weightStr != "" else { alertManager.setAlert(self, flag: .weightMissing); return }
        guard let height = Double(heightStr) else { alertManager.setAlert(self, flag: .heightNotNumber); return }
        guard let weight = Double(weightStr) else { alertManager.setAlert(self, flag: .weightNotNumber); return }
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC")
                as? SecondViewController else { return }
        
        bmiManager.calculateBMI(height: height, weight: weight)
        
        secondVC.bmi = bmiManager.getBMI()
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true)
        
        heightTextField.text = ""
        weightTextField.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if Double(string) != nil || string == "" || string == "." {
//            return true
//        }
//        return false
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
        } else if weightTextField.text == "" {
            weightTextField.becomeFirstResponder()
        }
        return true
    }
}
