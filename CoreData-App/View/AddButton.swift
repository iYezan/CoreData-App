//
//  AddButton.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class AddButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.setImage(UIImage(systemName: "plus.square.fill"), for: .normal)
        self.contentVerticalAlignment   = .fill
        self.contentHorizontalAlignment = .fill
    }
    
    func setButtonConstraints(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 40),
            self.heightAnchor.constraint(equalToConstant: 40),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
    }
}
