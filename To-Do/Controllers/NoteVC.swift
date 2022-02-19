//
//  NoteVC.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class NoteVC: UIViewController {
    
    var noteId: String!
    var textView: UITextView!
    var textField: UITextField!
    var index: Int!
    var noteCell: NoteCell?

    override func viewDidLoad() {
        super.viewDidLoad()
        index = MainVC.notes.firstIndex(where: {$0.id == noteId})!
        view.backgroundColor = .systemBackground
        self.navigationItem.largeTitleDisplayMode = .never
 
        setupNavigationBarItem()
        setupTextView()
        setupTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let note = MainVC.notes[index]
        textView.text   = note.text
        textField.text  = note.title
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let noteCell = noteCell else {
            return
        }
        noteCell.prepareNote()
        noteCell.configure(note: MainVC.notes[index])
        noteCell.configureLabels()
    }

    private func setupTextView() {
        textView = CustomtextView(frame: .zero)
        view.addSubview(textView)
        textView.delegate = self
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: view.frame.size.height * 0.09),
            textView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -100),
            textView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -56)
        ])
    }
    
    private func setupTextField() {
        textField = CustomTextField(frame: .zero)
        view.addSubview(textField)
        textField.delegate = self
        
        NSLayoutConstraint.activate([
            textField.bottomAnchor.constraint(equalTo: textView.topAnchor, constant: -10),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 30),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -70)
        ])
    }
}
