//
//  CustomLabel.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit

final class CustomLabel: UILabel {
    func configure(color: UIColor, numberOfLines: Int, font: UIFont) {
        textColor = color
        self.numberOfLines = numberOfLines
        self.font = font
    }
}

