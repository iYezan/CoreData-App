//
//  ViewController.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class MainVC: UIViewController, UISearchResultsUpdating {
 
    var searchedItmes = [Note]()
    static var notes = [Note]()
    // var item = Item.mockData // Item model
    
    var searchController  = UISearchController(searchResultsController: nil)
    
    var tableView: UITableView?
    let label = UILabel()            // Appears if there's no notes yet
    let button = AddButton()         // Button at the botttom right corner

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupNavigationController()
        
        setupTableView()
        setupButton()
        setupLabel()
        fetchNotesFromStorage()
        searchBar()
    }
    
    // Call NoteVC 1
    @objc private func didTapButton() {
        
        let newNote = CoreDataManager.shared.createNote()
        MainVC.notes.insert(newNote, at: 0)
        
        tableView!.beginUpdates()
        tableView!.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        tableView!.endUpdates()
        
        let noteVC = NoteVC()
        noteVC.noteCell = nil
        noteVC.set(noteId: newNote.id)
        noteVC.set(noteCell: (tableView?.cellForRow(at: IndexPath(row: 0, section: 0) ) as! NoteCell))
        
        navigationController?.pushViewController(noteVC, animated: true)
    }
    
    // Call NoteVC 2
    private func setupButton() {
        view.addSubview(button)
        button.setButtonConstraints(view: view)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setupLabel() {
        view.addSubview(label)
        label.text = "No notes yet"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 120),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupNavigationController() {
        title = "Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.hidesBarsOnSwipe = false
        navigationItem.hidesSearchBarWhenScrolling = false
       
    }
    
    // SearchBar design
    func searchBar() {
        searchController.searchResultsUpdater                   = self
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchBar.placeholder                  = "Search"
        navigationItem.searchController                         = searchController
        definesPresentationContext                              = true
    }
}



