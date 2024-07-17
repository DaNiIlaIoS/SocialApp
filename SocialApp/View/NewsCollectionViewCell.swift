//
//  NewsCollectionViewCell.swift
//  SocialApp
//
//  Created by Даниил Сивожелезов on 15.07.2024.
//

import UIKit
import SnapKit

final class NewsCollectionViewCell: UICollectionViewCell, CellProtocol {
    // MARK: - Static Properties
    static var reuseId: String = "NewsCollectionViewCell"
    
    // MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let image = CustomImage(frame: .zero)
        image.layer.cornerRadius = 20
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = CustomLabel()
        label.configure(color: .white, numberOfLines: 1, font: .systemFont(ofSize: 20, weight: .bold))
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = CustomLabel()
        label.configure(color: .gray, numberOfLines: 1, font: .systemFont(ofSize: 12))
         return label
     }()
    
    private lazy var textLabel: UILabel = {
        let label = CustomLabel()
        label.configure(color: .white, numberOfLines: 0, font: .systemFont(ofSize: 14))
         return label
     }()
    
    private lazy var readButton: UIButton = {
        let button = UIButton(primaryAction: UIAction(handler: { _ in
            print(1)
        }))
        button.setTitle("Читать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Methods
    func setupCell(item: CollectionItem) {
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        dateLabel.text = item.date
        textLabel.text = item.text
        
        setupUI()
    }
    
    private func setupUI() {
        addSubview(imageView)
        imageView.addSubview(titleLabel)
        imageView.addSubview(dateLabel)
        imageView.addSubview(textLabel)
        imageView.addSubview(readButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(titleLabel)
        }
        
        readButton.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(20)
        }
    }
}
