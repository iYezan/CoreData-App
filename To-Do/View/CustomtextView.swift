//
//  TextView.swift
//  CoreData-App
//
//  Created by iYezan on 16/02/2022.
//

import UIKit

class CustomtextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        let font                    = UIFont.systemFont(ofSize: 20)
        self.font                   = font
        self.autocorrectionType     = .no
        self.translatesAutoresizingMaskIntoConstraints  = false
    }

}
