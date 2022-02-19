//
//  Ext+NoteCell.swift
//  To-Do
//
//  Created by iYezan on 19/02/2022.
//

import UIKit

extension NoteCell {
    
    func configureLabels() {
        self.textLabel?.text = note?.title ?? ""
        self.detailTextLabel?.text = note?.text ?? ""
        
        guard let note = note else {
            print("Found nil value in variable note")
            return
        }
        
        let formatter = DateFormatter()
        if Date.isToday(day: note.date.get(.day)) {
            formatter.dateFormat = "HH:mm"
        } else if Date.isThisYear(year: note.date.get(.year)) {
            formatter.dateFormat = "MMM d"
        } else {
            formatter.dateFormat = "MM/dd/yyyy"
        }
        dateLabel.text = formatter.string(from: note.date)
    }
    
    func configure(note: Note) {
        self.note = note
    }
    
    func prepareNote() {
        self.note = nil
    }
}
