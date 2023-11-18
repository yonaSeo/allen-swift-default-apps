//
//  ViewController.swift
//  NextViewController
//
//  Created by yona on 11/18/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        firstVC.someText = "First View Controller"
        firstVC.modalPresentationStyle = .formSheet
        present(firstVC, animated: true)
    }
    
    @IBAction func storyBoardWithCodeButtonTapped(_ sender: UIButton) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.someText = "Second View Controller"
        secondVC.modalPresentationStyle = .formSheet
        present(secondVC, animated: true)
    }
    
    @IBAction func storyBoardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            guard let thirdVC = segue.destination as? ThirdViewController else { return }
            thirdVC.someText = "Third View Controller"
        }
        if segue.identifier == "toFourthVC" {
            guard let fourthVC = segue.destination as? FourthViewController else { return }
            fourthVC.someText = "Fourth View Controller"
        }
    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        return true
//    }
}

