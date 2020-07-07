//
//  CustomView.swift
//  DynamicFontSize
//
//  Created by Zafar on 7/7/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(dynamicFontLabel)
        
        NSLayoutConstraint.activate([
            dynamicFontLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dynamicFontLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            dynamicFontLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            dynamicFontLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Properties
    @IBInspectable var text: String = "" {
        didSet {
            dynamicFontLabel.text = text
            self.setNeedsLayout()
        }
    }
    
    // MARK: - UI
    let dynamicFontLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
