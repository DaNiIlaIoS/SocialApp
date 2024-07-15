//
//  CustomLabel.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit

final class CustomTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLabel() {
        font = .systemFont(ofSize: 14)
    }
    
    func configure(color: UIColor, numberOfLines: Int) {
        textColor = color
        self.numberOfLines = numberOfLines
    }
}

