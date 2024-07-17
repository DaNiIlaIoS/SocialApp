//
//  UsersCollectionViewCell.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

final class UsersCollectionViewCell: UICollectionViewCell, CellProtocol{
    // MARK: - Static Properties
    static var reuseId: String = "UsersCollectionViewCell"
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let image = CustomImage(frame: .zero)
        image.layer.cornerRadius = 25
        return image
    }()
    
    private lazy var nameLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .black, numberOfLines: 0, font: .systemFont(ofSize: 14, weight: .bold))
        return label
    }()
    
    private lazy var textLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .gray, numberOfLines: 0, font: .systemFont(ofSize: 14))
        label.textAlignment = .center
        return label
    }()
    
    private lazy var writeButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            print("Написать")
        }))
        button.setTitle("Написать", for: .normal)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 5
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(nameLabel)
        stack.addArrangedSubview(textLabel)
        stack.addArrangedSubview(writeButton)
        
        return stack
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func setupCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
        nameLabel.text = item.title
        textLabel.text = item.text

        addSubview(stackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
        }
    }
}
