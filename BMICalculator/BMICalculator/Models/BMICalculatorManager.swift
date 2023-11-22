//
//  BMICalculatorManager.swift
//  BMICalculator
//
//  Created by yona on 11/22/23.
//

import UIKit

struct BMICalculatorManager {
    private var bmi: BMI?
    
    func getBMI() -> BMI? {
        return self.bmi
    }
    
    mutating func calculateBMI(height: Double, weight: Double) {
        let bmiRaw = (weight * 10000) / (height * height)
        let bmiRounded = round(bmiRaw * 10) / 10
        
        bmi = BMI(value: bmiRounded)
        
        switch bmiRounded {
        case ..<18.5:
            bmi?.backgroundColor = .systemBlue
            bmi?.labelText = "💀 살 찌세요."
        case 18.5..<23:
            bmi?.backgroundColor = .systemGreen
            bmi?.labelText = "🧑‍⚕️ 딱 좋아요."
        case 23..<25:
            bmi?.backgroundColor = .systemOrange
            bmi?.labelText = "🐷 살 빼세요."
        case 25...:
            bmi?.backgroundColor = .systemRed
            bmi?.labelText = "😇 살고 싶어요?"
        default:
            bmi?.backgroundColor = .black
            bmi?.labelText = "No Data"
        }
    }
}
