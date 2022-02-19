//
//  Ext+NoteVC.swift
//  To-Do
//
//  Created by iYezan on 19/02/2022.
//

import UIKit

extension NoteVC: UITextViewDelegate, UITextFieldDelegate {
    
    func setupNavigationBarItem() {
        navigationItem.rightBarButtonItem   = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
    }
    
    func set(noteId: String) {
        self.noteId = noteId
    }
    
    func set(noteCell: NoteCell) {
        self.noteCell = noteCell
    }
    
    func textViewDidChange(_ textView: UITextView) {
        MainVC.notes[index].text = textView.text
        CoreDataManager.shared.save()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        MainVC.notes[index].title = textField.text!
        CoreDataManager.shared.save()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        self.navigationController?.popViewController(animated: false)
    }
}
