//
//  ViewController.swift
//  FirstNewApp
//
//  Created by yona on 11/7/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var timer: Timer?
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요!⏲️"
        slider.value = 0.5
    }
    
    @objc func timerAction() {
        print(#function + "\(mainLabel.text!)")
        guard mainLabel.text != "초를 선택하세요!⏲️" else { timer?.invalidate(); return }
//        guard let seconds = mainLabel.text else { return }
//        guard let secondsInt = Int(seconds.components(separatedBy: .decimalDigits.inverted ).joined()) else { return }
        if seconds > 0 {
            seconds -= 1
            mainLabel.text = "\(seconds)초"
            slider.setValue((Float(seconds) / Float(60)), animated: true)
        } else {
            timer?.invalidate()
            seconds = 0
            mainLabel.text = "초를 선택하세요!⏲️"
            AudioServicesPlaySystemSound(SystemSoundID(1322))
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        seconds = Int(sender.value * 60)
        mainLabel.text = "\(seconds)초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [ weak self ] _ in
//            self?.timerAction()
//        })
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        mainLabel.text = "초를 선택하세요!⏲️"
        slider.setValue(0.5, animated: true)
        number = 0
    }
}

