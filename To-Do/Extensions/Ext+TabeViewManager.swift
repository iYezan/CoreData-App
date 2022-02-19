//
//  TabeViewManager.swift
//  CoreData-App
//
//  Created by iYezan on 17/02/2022.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    internal func setupTableView() {
        let tableView = UITableView(frame: .zero)
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.separatorColor = .systemGray3
        self.tableView = tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
            label.isHidden = false
            MainVC.notes.count == 0 ? label.animateIn() : label.animateOut()
            return MainVC.notes.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.id, for: indexPath) as? NoteCell else {
            return UITableViewCell()
        }
        // cell.textLabel?.text = item[indexPath.row].name //  For Item model
        
        cell.configure(note: MainVC.notes[indexPath.row])
        cell.configureLabels()
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { 105 }
}

extension MainVC {
    
    func fetchNotesFromStorage() {
        MainVC.notes    = CoreDataManager.shared.fetchNotes()
    }
}
