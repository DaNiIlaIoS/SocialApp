//
//  EventCollectionViewCell.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

final class EventCollectionViewCell: UICollectionViewCell, CellProtocol {
    // MARK: - Static Properties
    static var reuseId: String = "EventCollectionViewCell"
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let image = CustomImage(frame: .zero)
        return image
    }()
    
    private lazy var nextButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return button
    }()
    
    private lazy var textLabel: UILabel = {
        let label = CustomLabel()
        label.configure(color: .black, numberOfLines: 1, font: .systemFont(ofSize: 14))
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 10
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(textLabel)
        stack.addArrangedSubview(nextButton)
        
        return stack
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
        textLabel.text = item.text
        
        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(25)
        }
    }
}
