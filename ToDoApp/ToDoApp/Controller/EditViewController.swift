//
//  EditViewController.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit

final class EditViewController: UIViewController {
    private let editView = EditView()
    private lazy var colorButtons = [editView.redButton, editView.yellowButton, editView.greenButton, editView.blueButton]
    
    var delegate: ToDoTableViewDelegate?
    var tagNum: Int64?
    var toDoData: ToDoData? {
        didSet { tagNum = toDoData?.color }
    }
    
//    var reloadViewController: (() -> Void)?
    
    override func loadView() {
        self.view = editView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editView.backgroundColor = .white
        editView.textView.delegate = self
        
        clearColorButton()
        setupUI()
        setupButtonTarget()
    }
    
    func clearColorButton() {
        // editView.redButton.backgroundColor = Color.red.lightColor
        // editView.redButton.setTitleColor(Color.red.darkColor, for: .normal)
        // ...
        self.colorButtons.forEach { button in
            button.backgroundColor = Color(rawValue: Int64(button.tag))?.lightColor
            button.setTitleColor(Color(rawValue: Int64(button.tag))?.darkColor, for: .normal)
        }
    }
    
    
    func setupUI() {
        if let toDoData { // UPDATE 버튼으로 들어온 경우
            self.title = "수정하기"
            
            guard let text = toDoData.memoText else { return }
            editView.textView.text = text
            editView.textView.textColor = .black
            editView.textView.becomeFirstResponder()
            editView.saveButton.setTitle("UPDATE", for: .normal)
            setupColorTheme(color: Color(rawValue: toDoData.color)!)
            
        } else { // + 버튼으로 들어온 경우
            self.title = "추가하기"
            self.tagNum = Color.green.rawValue
            
            editView.textView.text = "텍스트를 여기에 입력하세요"
            editView.textView.textColor = .lightGray
            editView.saveButton.setTitle("SAVE", for: .normal)
            setupColorTheme(color: Color.green)
        }
        setupColorButtonActivation(color: Color(rawValue: self.tagNum!)!)
    }
    
    func setupColorTheme(color: Color) {
        editView.textBackView.backgroundColor = color.lightColor
        editView.saveButton.backgroundColor = color.darkColor
    }
    
    func setupColorButtonActivation(color: Color) {
        self.colorButtons[Int(color.rawValue)-1].backgroundColor = color.darkColor
        self.colorButtons[Int(color.rawValue)-1].setTitleColor(.white , for: .normal)
    }
    
    func setupButtonTarget() {
        self.colorButtons.forEach { $0.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)}
        editView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func colorButtonTapped(_ sender: UIButton) {
        let tagNum = Int64(sender.tag)
        self.tagNum = tagNum
        
        clearColorButton()
        setupColorButtonActivation(color: Color(rawValue: tagNum)!)
        setupColorTheme(color: Color(rawValue: tagNum)!)
    }
    
    @objc func saveButtonTapped() {
        if let toDoData { // UPDATE로 들어온 경우
            toDoData.memoText = editView.textView.text
            toDoData.color = self.tagNum!
            CoreDataManager.shared.updateToDoItem(updateItem: toDoData) {
                print("수정 완료")
                self.navigationController?.popViewController(animated: true)
            }
        } else { // +로 들어온 경우
            let memoText = editView.textView.text
            CoreDataManager.shared.setToDoItem(memoText: memoText, color: tagNum!) {
                print("추가 완료")
                self.navigationController?.popViewController(animated: true)
            }
        }
//        reloadViewController?()
        delegate?.reload()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension EditViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "텍스트를 여기에 입력하세요" {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "텍스트를 여기에 입력하세요"
            textView.textColor = .lightGray
        }
    }
}
