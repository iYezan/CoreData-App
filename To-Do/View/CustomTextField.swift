//
//  TextField.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let font                    = UIFont.boldSystemFont(ofSize: 28)
        self.font                   = font
        self.autocorrectionType     = .no
        let attributes: [ NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.gray
        ]
        self.attributedPlaceholder  = NSAttributedString(string: "Title", attributes: attributes)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
