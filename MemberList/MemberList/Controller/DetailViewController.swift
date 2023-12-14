//
//  DetailViewController.swift
//  MemberList
//
//  Created by yona on 12/11/23.
//

import UIKit
import PhotosUI

final class DetailViewController: UIViewController {
    private let detailView = DetailView()
    weak var delegate: MemberDelegate?
    var member: Member?
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTextFiledDelegate()
        setupTapGesture()
        setupButtonAction()
    }
    
    func setupData() {
        detailView.member = member
    }
    
    func setupTextFiledDelegate() {
        detailView.memberIDTextField.delegate = self
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setupPhotosPicker))
        detailView.memberImageView.addGestureRecognizer(tapGesture)
        detailView.memberImageView.isUserInteractionEnabled = true
    }
    
    @objc func setupPhotosPicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        
        present(picker, animated: true)
    }
    
    func setupButtonAction() {
        detailView.updateButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc func updateButtonTapped() {
        if member != nil {
            // update
            let memberId = member!.memberID
            member!.memberImage = detailView.memberImageView.image
            member!.name = detailView.memberNameTextField.text ?? ""
            member!.age = Int(detailView.memberAgeTextField.text ?? "")
            member!.phoneNumber = detailView.memberPhoneNumberTextField.text ?? ""
            member!.address = detailView.memberAddressTextField.text ?? ""
            
//            let idx = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[idx] as! ViewController
//            vc.memberListManager.updateMember(idx: memberId, member!)
            delegate?.updateMember(idx: memberId, member!)
        } else {
            // insert
            let name = detailView.memberNameTextField.text ?? ""
            let age = Int(detailView.memberAgeTextField.text ?? "")
            let phoneNumber = detailView.memberPhoneNumberTextField.text ?? ""
            let address = detailView.memberAddressTextField.text ?? ""
            
            let newMember = Member(name: name, age: age, phoneNumber: phoneNumber, address: address)
            
//            let idx = navigationController!.viewControllers.count - 2
//            let vc = navigationController?.viewControllers[idx] as! ViewController
//            vc.memberListManager.insertMember(newMember)
            delegate?.insertMember(newMember)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { image, err in
                DispatchQueue.main.async {
                    self.detailView.memberImageView.image = image as? UIImage
                }
            }
        } else {
            print("itemProvider failed to load object...")
        }
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == detailView.memberIDTextField {
            return false
        }
        
        return true
    }
}
