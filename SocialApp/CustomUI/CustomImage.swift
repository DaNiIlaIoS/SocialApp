//
//  CustomImage.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit

class CustomImage: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createImageView() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
