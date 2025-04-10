//
//  AddViewController.swift
//  TodoListErrorNil20min
//
//  Created by Abubakar Bibulatov on 10.04.2025.
//

import UIKit

class AddViewController: UIViewController {
    
    private let manager = CoreDataManager.shared
    var note: Note?
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter Text"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 60).isActive = true
        text.backgroundColor = .gray
        
        return text
    }()
    
    lazy var textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.heightAnchor.constraint(equalToConstant: 100).isActive = true
        text.backgroundColor = .gray
        text.font = UIFont.systemFont(ofSize: 16)
        return text
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(primaryAction: action)
        btn.setTitle("Save", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()

    lazy var action = UIAction { _ in
        if self.note == nil {
            self.manager.addNewNote(title: self.textField.text ?? "", text: self.textView.text ?? "")
        } else {
            self.note?.updateNote(title: self.textField.text ?? "", text: self.textView.text ?? "")
        }
        
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textField)
        view.addSubview(textView)
        view.addSubview(btn)
        
        setupTranslate()
    }
    
    private func setupTranslate() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}
