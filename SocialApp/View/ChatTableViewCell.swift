//
//  ChatTableViewCell.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 16.07.2024.
//

import UIKit
import SnapKit

final class ChatTableViewCell: UITableViewCell {
    
    static let reuseId = "ChatTableViewCell"
    
    private lazy var cellImage: UIImageView = {
        let image = CustomImage(frame: .zero)
        image.layer.cornerRadius = 25
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .black, numberOfLines: 0, font: .systemFont(ofSize: 16, weight: .bold))
        return label
    }()
    
    private lazy var messageLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .black, numberOfLines: 0, font: .systemFont(ofSize: 14))
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(messageLabel)
        
        return stack
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
         stack.axis = .horizontal
        stack.distribution = .fill
         stack.alignment = .fill
        stack.spacing = 10
        
         stack.addArrangedSubview(cellImage)
         stack.addArrangedSubview(verticalStackView)
         
         return stack
    }()
    
    func setupCell(chat: CollectionItem) {
        cellImage.image = UIImage(named: chat.image)
        nameLabel.text = chat.title
        messageLabel.text = chat.text
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(horizontalStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        cellImage.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}
