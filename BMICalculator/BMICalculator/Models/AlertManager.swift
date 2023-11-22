//
//  Alert.swift
//  BMICalculator
//
//  Created by yona on 11/22/23.
//

import UIKit

struct AlertManager {
    enum AlertFlag {
        case heightMissing
        case weightMissing
        case heightNotNumber
        case weightNotNumber
    }
    
    mutating func setAlert(_ vc: ViewController, flag: AlertFlag) {
        var string = ""
        switch flag {
        case .heightMissing: string = "키를 입력하세요"
        case .weightMissing: string = "몸무게를 입력하세요"
        case .heightNotNumber: string = "키를 숫자로 입력하세요"
        case .weightNotNumber: string = "몸무게를 숫자로 입력하세요"
        }
        
        let alert = UIAlertController(title: "잘못된 입력 값", message: "\(string)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        vc.present(alert, animated: true)
    }
}
