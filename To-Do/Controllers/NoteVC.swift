//
//  NoteVC.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class NoteVC: UIViewController {

    private var noteId: String!
    private var textView: UITextView!
    private var textField: UITextField!
    private var index: Int!
    var noteCell: NoteCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupTextView() {
       
    }
    
    func set(noteId: String) {
        self.noteId = noteId
    }
    
    func set(noteCell: NoteCell) {
        self.noteCell = noteCell
    }
}
